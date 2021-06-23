$regfile = "attiny44.dat"
$crystal = 1000000
Config Porta.0 = Output
Config Porta.1 = Output
Config Porta.2 = Output
Config Porta.3 = Output

Config Pina.5 = Input
Config Pina.6 = Input
Config Pina.7 = Input

Config 1wire = PINA.4

Dim A As String * 5
Dim B As String * 1
Dim C As Byte

Dim D As Byte
Dim G As String * 2
Open "comb.0:9600,8,n,1" For Input As #1

Open "comb.1:9600,8,n,1" For Output As #2
Do
   Input #1 , A
   B = Mid(a , 1 , 1)
   C = Hexval(b)
   If C = 0 Then



      G = Mid(a , 2 , 2)
      D = Hexval(g)                                               'в змінну D зчитуємо адресу байта який хочемо записати
      G = Mid(a , 2 , 4)
      C = Hexval(g)                                               'в змінну C зчитуємо значення байта який хочемо записати
      1wwrite &HCC                                                'вказуємо, що наступна команда адресована всім пристроям на лінії 1-wire
      1wwrite &H0F                                                'команда запису даних до скретч-пам'яті
      1wwrite D                                                   'надсилаємо адресу байту
      1wwrite C

   End If
   If C = 1 Then
    C = 0
    C.0 = Not Pina.7
    C.1 = Not Pina.6
    C.2 = Not Pina.5
    Print #2 , Hex(c)
   End If
   1wreset
   Loop
End