.586P														; ������� ������ (��������� Pentium)
.MODEL FLAT, STDCALL										; ������ ������, ���������� � �������
includelib kernel32.lib										; ������������: ����������� � kernel32

ExitProcess PROTO: DWORD									; �������� ������� ��� ���������� �������� Windows 
MessageBoxA PROTO: DWORD, : DWORD, : DWORD, : DWORD 
.stack 4096													; ��������� ����� ������� 4 ���������

.const														; ���������

.data
MB_OK	EQU 0
STR1	DB "��� ������ ���������", 0
STR2	DB "������ ����!", 0
HW		DD ?
.code

main PROC													; ����� ����� main
	START :
		INVOKE MessageBoxA, HW, OFFSET STR2, OFFSET STR1, MB_OK
	
	push -1;												; �������� � ���� ��� ���������� �������� Windows
	call ExitProcess										; ���������� �������� Windows
main ENDP													; ����� ���������
end main													; ����� ������ main   