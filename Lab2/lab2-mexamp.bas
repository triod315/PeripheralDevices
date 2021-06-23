$regfile = "attiny44.dat"                    '������� ��� �������������
$crystal = 1000000                           '������������ ������� �������

Config Porta.0 = Output
Config Porta.1 = Output
Config Porta.2 = Output
Config Porta.3 = Output

Config 1wire = Porta.4                        '����������� ���� �� ������ �� ���������� 1-wire
Config Int0 = Rising                          '������������ ����������
Config Pinb.2 = Input


Dim A As String * 5
Dim B As Byte
Dim C As Byte
Dim D As Byte
Dim G As String * 2
Dim I as Byte

Open "comb.0:9600,8,n,1" For Input As #1      '���������� ����, �� ���� ��'�����
Open "comb.1:9600,8,n,1" For Output As #2     '�������� ����������� �����

Enable Interrupts                             '������� �����������
Enable Int0                                   '������� ����������� INT0
On Int0 Rts

Do
   B = 0
   C = 0
   B.0 = Not Pina.7                          '�������� ������ � �����������
   B.1 = Not Pina.6
   B.2 = Not Pina.5

   1wwrite &HCC                              '������� ���� ������� ���'�� � ������
   1wwrite &HF0
   1wwrite &H00
   1wreset

   D = Hex(B)                                '������� �������� ����� �� ������� B
   1wwrite &HCC
   1wwrite &HAA
   1wwrite B
   C = 1wread()
   1wreset

   Shiftout Porta.1 , Porta.3 , C , 1        '�������� ��� �� ����
   Pulseout Porta , 2 , 1

   waitms 100                                '�������� ��� �������� ���������������� ���������
Loop

Rts:
   1wreset
   Porta.0 = 1
   Input #1 , A
   Porta.0 = 0                              '������� ������ � ����������� ����� � ����� A
   G = Mid(a , 1 , 1)                       '� ����� G �������� ������ ������ ������ A
   B = Hexval(g)                            '���������� ������������� �������� G � ���� B
   If B = 3 Then                            '���� 3 �� ������������ �������� ������� �����
       G = Mid(a , 2 , 2)
       D = Hexval(g)                        '� ����� D ������� ������ ����� ���� ������ ��������
       G = Mid(a , 4 , 2)
       C = Hexval(g)                        '� ����� C ������� �������� ����� ���� ������ ��������
       1wwrite &HCC                         '�������, �� �������� ������� ���������� ��� ��������� �� �� 1-wire
       1wwrite &H0F                         '������� ������ ����� �� ������-���'��
       1wwrite D                            '��������� ������ �����
       1wwrite C                            '��������� �������� �����
       1wreset
       1wwrite &HCC                         '�������, �� �������� ������� ���������� ��� ��������� �� �� 1-wire
       1wwrite &H55                         '������� ��������� ����� � ������-���'�� �� ������� ���'��
       1wwrite &HA5                         '��������� ���� ��������
       Porta.4 = 1                          '������������ ��� ����� � ������ ������� �� 10��
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