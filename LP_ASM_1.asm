.586P														; система команд (процессор Pentium)
.MODEL FLAT, STDCALL										; модель памяти, соглашение о вызовах
includelib kernel32.lib										; компановщику: компоновать с kernel32

ExitProcess PROTO: DWORD									; прототип функции для завершения процесса Windows 
MessageBoxA PROTO: DWORD, : DWORD, : DWORD, : DWORD 
.stack 4096													; выделение стека объёмом 4 мегабайта

.const														; константы

.data
MB_OK	EQU 0
STR1	DB "Моя первая программа", 0
STR2	DB "Привет всем!", 0
HW		DD ?
.code

main PROC													; точка входа main
	START :
		INVOKE MessageBoxA, HW, OFFSET STR2, OFFSET STR1, MB_OK
	
	push -1;												; помещаем в стек код завершения процесса Windows
	call ExitProcess										; завершение процесса Windows
main ENDP													; конец процедуры
end main													; конец модуля main   