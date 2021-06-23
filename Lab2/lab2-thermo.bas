$regfile = "attiny44.dat"                                   '������� ��� �������������
$crystal = 1000000                                          '������������ ������� �������

Config 1wire = Porta.1                                      '����������� ����� �� ������ �� ���������� 1-wire
Config Porta.0 = Output                                     '����������� ����� �� ����
Config Pinb.2 = Input                                       '����������� ����� �� �����
Config Int0 = Rising                                        '����������� ����������� ����������� INT0 �� ���������� ������

Dim S As String * 4
Dim A As Byte
Dim B As Byte
Dim C As Byte
Dim D As String * 1

Open "comb.0:9600,8,n,1" For Input As #1                    '���������� �����, �� ���� ��'������
Open "comb.1:9600,8,n,1" For Output As #2                   '�������� ����������� �����

1wreset                                                     '�������� �������� ���� 1-wire

Enable Interrupts                                           '������� �����������
Enable Int0                                                 '������� ����������� INT0
On Int0 Rts                                                 '������ �������� �����������

Do
1wwrite &HCC                                                '�������, �� �������� ������� ���������� ��� ��������� �� ���� 1-wire
1wwrite &H44                                                '������� ����������� ����������� � ������� ������
Waitms 750                                                  '������ 750 ��
1wreset                                                     '�������� �������� ���� 1-wire
1wwrite &HCC                                                '�������, �� �������� ������� ���������� ��� ��������� �� ���� 1-wire
1wwrite &HBE                                                '������� ������� ���'�� �������
A = 1wread()                                                '������� ��� ����� � ���� 1-wire � ����� A �� B
B = 1wread()
S = Hex(b)                                                  '������������ ����� A �� B � ������ � ���������������� ������
S = S + Hex(a)
1wreset                                                     '�������� �������� ���� 1-wire
Loop

Rts:                                                        '�������� ����������� INT0
Porta.0 = 1                                                 '������������ ������ CTS ��� �����
Input #1 , D                                                '������� ������ � ����������� ����� � ����� A
Porta.0 = 0                                                 '��������� ������ CTS ��� �����
C = Hexval(d)                                               '������������ ������������� �������� ����� D � ���� C
If C = 0 Then                                               '���� �������� 0 ��
Print #2 , S                                                '��������� �� ���������� ���� ����� S
End If
Return                                                      '����������� �� ��������� �����

End
