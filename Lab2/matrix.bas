$regfile = "attiny44.dat"                                   'вказуємо наш мікроконтролер
$crystal = 1000000                                          'встановлюємо тактову честоту

Config Porta = Output                                       'конфігуруємо всі ніжки порту A як виходи
Config Pinb.2 = Input                                       'конфігуруємо ніжку як вхід
Config Int0 = Rising                                        'конфігуруємо спрацювання переривання INT0 по передньому фронту

Dim A As Byte
Dim E As Byte
Dim B(8) As Byte
Dim C As Byte                                               'в цьому масиві зберігається наше зображення
Dim D As Byte
Dim S As String * 16
Dim G As String * 2

Open "comb.0:9600,8,n,1" For Input As #1                    'кофігуруємо ніжки, до яких під'єднані
Open "comb.1:9600,8,n,1" For Output As #2                   'контакти послідовного порта

C = &B11111110                                              'значення змінної вказує на те, який рядок світиться

Enable Interrupts                                           'вмикаємо переривання
Enable Int0                                                 'вмикаємо переривання INT0
On Int0 Rts                                                 'додаємо обробник переривання

Do
For A = 1 To 8                                              'обходимо всі елементи масиву та виводимо їх на матрицю
Shiftout Porta.1 , Porta.3 , C , 1
Shiftout Porta.1 , Porta.3 , B(a) , 1
Pulseout Porta , 2 , 1
Rotate C , Left                                             'циклічний зсув змінної C вліво
Next
Loop

Rts:                                                        'обробник переривання INT0
Porta.0 = 1                                                 'встановлюємо сигнал CTS для хоста
Input #1 , S                                                'зчитуємо строку з послідовного порта у змінну S
Porta.0 = 0                                                 'прибираємо сигнал CTS для хоста
For E = 1 To 8                                              'записуємо нові значення до масиву з зображенням
D = 2 * E
D = D - 1
G = Mid(s , D , 2)
B(e) = Hexval(g)
Next
Return

End
