$regfile="attiny44.dat"    'вказуємо мікроконтролер
$crystal=1000000           'тактова частота

Config 1wire=PORTA.0       'конфігурація ніжки за протоколом 1-wire

Dim A As String * 5
Dim B As Byte
Dim C As Byte
Dim D As Byte
Dim G As String * 2

Open "comb.0:9600,8,n,1" For Input As #1
Open "comb.1:9600,8,n,1" For Input As #2

1wreset                    'скидання 1-wire

Do
Input #1, A
G = Mid (a,1,1)
B = Hexval(g)
If B=0 Then
   1wwrite &HCC
   1wwrite &HF0
   1wwrite &H00
Else
If B=1 Then
   1wwrite &HCC
   1wwrite &H55
   1wwrite &HA5
   Porta.0=1
   Waitms 10
Else
If B=2 Then
   G=Mid(a,2,2)
   D=Hexval(g)
   1wwrite &HCC
   1wwrite &HAA
   1wwrite D
   C=1wread()
   Print #2 , Hex(C)
Else
   If B=3 Then
   G=Mid(a,2,2)
   D=Hexval(g)
   G=Mid(a,4,2)
   C=Hexval(g)

1wwrite &HCC
1wwrite &H0F
1wwrite D
1wwrite C
End if
End if
End if
End if
1wreset
Loop
End