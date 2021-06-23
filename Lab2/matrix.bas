$regfile = "attiny44.dat"                                   '������� ��� �������������
$crystal = 1000000                                          '������������ ������� �������

Config Porta = Output                                       '����������� �� ���� ����� A �� ������
Config Pinb.2 = Input                                       '����������� ���� �� ����
Config Int0 = Rising                                        '����������� ����������� ����������� INT0 �� ���������� ������

Dim A As Byte
Dim E As Byte
Dim B(8) As Byte
Dim C As Byte                                               '� ����� ����� ���������� ���� ����������
Dim D As Byte
Dim S As String * 16
Dim G As String * 2

Open "comb.0:9600,8,n,1" For Input As #1                    '���������� ����, �� ���� ��'�����
Open "comb.1:9600,8,n,1" For Output As #2                   '�������� ����������� �����

C = &B11111110                                              '�������� ����� ����� �� ��, ���� ����� ��������

Enable Interrupts                                           '������� �����������
Enable Int0                                                 '������� ����������� INT0
On Int0 Rts                                                 '������ �������� �����������

Do
For A = 1 To 8                                              '�������� �� �������� ������ �� �������� �� �� �������
Shiftout Porta.1 , Porta.3 , C , 1
Shiftout Porta.1 , Porta.3 , B(a) , 1
Pulseout Porta , 2 , 1
Rotate C , Left                                             '�������� ���� ����� C ����
Next
Loop

Rts:                                                        '�������� ����������� INT0
Porta.0 = 1                                                 '������������ ������ CTS ��� �����
Input #1 , S                                                '������� ������ � ����������� ����� � ����� S
Porta.0 = 0                                                 '��������� ������ CTS ��� �����
For E = 1 To 8                                              '�������� ��� �������� �� ������ � �����������
D = 2 * E
D = D - 1
G = Mid(s , D , 2)
B(e) = Hexval(g)
Next
Return

End
