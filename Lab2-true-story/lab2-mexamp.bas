$regfile = "attiny44.dat"                    'вказуємо наш мікроконтролер
$crystal = 1000000                           'встановлюємо тактову честоту

Config Porta.0 = Output
Config Porta.1 = Output
Config Porta.2 = Output
Config Porta.3 = Output

Config 1wire = Porta.4                        'конфігуруємо ніжку на роботу за протоколом 1-wire
Config Int0 = Rising                          'налаштування переривань
Config Pinb.2 = Input


Dim A As String * 5
Dim B As Byte
Dim C As Byte
Dim D As Byte
Dim G As String * 2
Dim I as Byte

Open "comb.0:9600,8,n,1" For Input As #1      'кофігуруємо ніжки, до яких під'єднані
Open "comb.1:9600,8,n,1" For Output As #2     'контакти послідовного порта

Enable Interrupts                             'вмикаємо переривання
Enable Int0                                   'вмикаємо переривання INT0
On Int0 Rts

Do
   B = 0
   C = 0
   B.0 = Not Pina.7                          'отримуємо адресу з перимикачів
   B.1 = Not Pina.6
   B.2 = Not Pina.5

   1wwrite &HCC                              'копіюємо вміст постійної пам'яті в скретч
   1wwrite &HF0
   1wwrite &H00
   1wreset

   D = Hex(B)                                'зчитуємо значення байту за адресою B
   1wwrite &HCC
   1wwrite &HAA
   1wwrite B
   C = 1wread()
   1wreset

   Shiftout Porta.1 , Porta.3 , C , 1        'виводимо біти на діоти
   Pulseout Porta , 2 , 1

   waitms 100                                'затримка щоб уникнути перенавантаження емулятора
Loop

Rts:
   1wreset
   Porta.0 = 1
   Input #1 , A
   Porta.0 = 0                              'зчитуємо строку з послідовного порта у змінну A
   G = Mid(a , 1 , 1)                       'у змінну G записуємо перший символ строки A
   B = Hexval(g)                            'конвертуємо шіснадцяткове значення G у байт B
   If B = 3 Then                            'якщо 3 то встановлюємо значення певного байту
       G = Mid(a , 2 , 2)
       D = Hexval(g)                        'в змінну D зчитуємо адресу байта який хочемо записати
       G = Mid(a , 4 , 2)
       C = Hexval(g)                        'в змінну C зчитуємо значення байта який хочемо записати
       1wwrite &HCC                         'вказуємо, що наступна команда адресована всім пристроям на лінії 1-wire
       1wwrite &H0F                         'команда запису даних до скретч-пам'яті
       1wwrite D                            'надсилаємо адресу байту
       1wwrite C                            'надсилаємо значення байту
       1wreset
       1wwrite &HCC                         'вказуємо, що наступна команда адресована всім пристроям на лінії 1-wire
       1wwrite &H55                         'команда копіювання даних зі скретч-пам'яті до постійної пам'яті
       1wwrite &HA5                         'надсилаємо ключ перевірки
       Porta.4 = 1                          'встановлюємо лінію даних в логічну одиницю на 10мс
       Waitms 10
   Else
   If B = 4 Then
       B = 0
       B.0 = Not Pina.7
       B.1 = Not Pina.6
       B.2 = Not Pina.5
       Print #2 , Hex(B)
      End If
   End If
   End If

   1wreset

Return
End