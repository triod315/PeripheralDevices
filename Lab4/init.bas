$regfile = "m8def.dat"
$crystal = 8000000
$hwstack = 40
$swstack = 16
$framesize = 32

Dim A as String * 8 'for condition
Dim S as String * 8 'output on display
Dim B as Byte
Dim State as Byte

'config Port C as output for LED
Config Portc = Output

'config UART for microcontroller
Open "comd.0:9600,8,n,1" For Output As #1
Open "comd.1:9600,8,n,1" For Input As #2

'config display format
Config Lcd =20*4
'config pins for display connection
Config Lcdpin=Pin, Db4=PORTb.3, Db5=PORTB.2, Db6=PORTB.1, Db7=PORTB.0, E=PORTB.4, Rs=Portb.5

Lcd "Hello world"

Config PortD.3 = Output

Config Portd.4=OUTPUT
Speaker Alias Portd.4

Config Int0=LOW_LEVEL
Dim Melcount As Byte
On Int0 Button
Enable Interrupts
Enable Int0

Declare Sub Melody1()
Declare Sub Melody2()
Declare Sub Melody3()
Declare Sub Play()

Do
   Input #2, A
   If A="Change" Then
      Input #2, A
      State=Val(A)
      Call Play()
   Endif
Loop

End

Sub Melody1()
Cls
Lcd "Lab melody"
      Sound Speaker, 65, 1274
      Waitms 125
      Sound Speaker, 87, 954
      Waitms 125
      Sound Speaker, 98, 850
      Waitms 125
      Sound Speaker, 87, 954
      Sound Speaker, 117, 715
      Waitms 125
      Sound Speaker, 110, 758
      Waitms 125
      Sound Speaker, 98, 850
      Waitms 125
      Sound Speaker, 110, 758
      Sound Speaker, 87, 954
      Waitms 125
      Wait 1
      Melcount=Melcount+1

   Melcount=0
End Sub

Sub Melody2()
Cls
Lcd "My Heart Will Go On"
'Celine Dion : : My Heart Will Go On
Sound Speaker , 587 , 1135 'D2(1/2)
Sound Speaker , 659 , 1011 'E2(1/2)
Sound Speaker , 880 , 388 'A3(1/4)
Sound Speaker , 880 , 758 'A2(1/2)
Sound Speaker , 392 , 850 'G2(1/4)
Sound Speaker , 185 , 901 'Fis2(1/8)
Sound Speaker , 659 , 1011 'E2(1/2)
Sound Speaker , 370 , 901 'Fis2(1/4)
Sound Speaker , 392 , 850 'G2(1/4)
Sound Speaker , 740 , 901 'Fis2(1/2)
Sound Speaker , 330 , 1011 'E2(1/4)
Sound Speaker , 294 , 1135 'D2(1/4)
Sound Speaker , 277 , 1203 'Cis2(1/4)
Sound Speaker , 587 , 1135 'D2(1/2)
Sound Speaker , 277 , 1203 'Cis2(1/4)
Sound Speaker , 3952 , 337 'H3(1/1)
Sound Speaker , 3440 , 388 'A3(1/1)
Sound Speaker , 1175 , 1135 'D2(1/1)
Sound Speaker , 659 , 1011 'E2(1/2)
Sound Speaker , 880 , 388 'A3(1/4)
Sound Speaker , 880 , 758 'A2(1/2)
Sound Speaker , 392 , 850 'G2(1/4)
Sound Speaker , 185 , 901 'Fis2(1/8)
Sound Speaker , 659 , 1011 'E2(1/2)
Sound Speaker , 370 , 901 'Fis2(1/4)
Sound Speaker , 392 , 850 'G2(1/4)
Sound Speaker , 740 , 901 'Fis2(1/2)
Sound Speaker , 330 , 1011 'E2(1/4)
Sound Speaker , 294 , 1135 'D2(1/4)
Sound Speaker , 277 , 1203 'Cis2(1/4)
Sound Speaker , 587 , 1135 'D2(1/2)
Sound Speaker , 277 , 1203 'Cis2(1/4)
Sound Speaker , 277 , 1203 'Cis2(1/4)
Sound Speaker , 587 , 1135 'D2(1/2)
Sound Speaker , 330 , 1011 'E2(1/4)
Sound Speaker , 740 , 901 'Fis2(1/2)Sound Speaker , 659 , 1011 'E2(1/2)
Sound Speaker , 1175 , 1135 'D2(1/1)
Wait 2


End Sub

Sub Melody3()
Cls
Lcd "Final Countdown"
   'Europe :: Final Countdown
Sound Speaker , 124 , 675 'H2(1/16)
Sound Speaker , 110 , 758 'A2(1/16)
Sound Speaker , 248 , 675 'H2(1/8)
Waitms 125 'P(1/16)
Sound Speaker , 165 , 1011 'E2(1/8)
Waitms 250 'P(1/8)
Waitms 125 'P(1/16)
Sound Speaker , 131 , 637 'C3(1/16)
Sound Speaker , 124 , 675 'H2(1/16)
Sound Speaker , 131 , 637 'C3(1/16)
Waitms 125 'P(1/16)
Sound Speaker , 124 , 675 'H2(1/16)
Waitms 125 'P(1/16)
Sound Speaker , 220 , 758 'A2(1/8)
Waitms 125 'P(1/16)
Waitms 250 'P(1/8)
Sound Speaker , 131 , 637 'C3(1/16)
Sound Speaker , 124 , 675 'H2(1/16)
Sound Speaker , 262 , 637 'C3(1/8)
Waitms 125 'P(1/16)
Sound Speaker , 165 , 1011 'E2(1/8)
Waitms 250 'P(1/8)
Waitms 125 'P(1/16)
Sound Speaker , 110 , 758 'A2(1/16)
Sound Speaker , 98 , 850 'G2(1/16)
Sound Speaker , 110 , 758 'A2(1/16)
Waitms 125 'P(1/16)
Sound Speaker , 98 , 850 'G2(1/16)
Waitms 125 'P(1/16)
Sound Speaker , 92 , 901 'Fis2(1/16)
Waitms 125 'P(1/16)
Sound Speaker , 110 , 758 'A2(1/16)
Waitms 125 'P(1/16)
Sound Speaker , 196 , 850 'G2(1/8)
Wait 2
End Sub


Sub Play()
   IF State=0 Then
      Call Melody1()
      State=State+1
      Return
   Endif
   If State=1 Then
      Call Melody2()
      State=State+1
      Return
   Else
      Call Melody3()
      State=0
      Return
   Endif
   Return
End Sub

Button:
   Call Play()
   Return





