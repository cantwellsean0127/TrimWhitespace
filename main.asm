VirtualAlloc proto
VirtualFree proto
ExitProcess proto
TrimWhitespace proto

.data
	
	CHAR_NULLBYTE equ 0

	MEM_RESERVE_COMMIT equ 12288
	
	PAGE_READWRITE equ 4
	
	MEM_RELEASE equ 32768

	EXIT_CODE_SUCCESS equ 0

.code

	main proc

		sub rsp, 8

		sub rsp, 32
		xor rcx, rcx
		mov rdx, 11
		mov r8, MEM_RESERVE_COMMIT
		mov r9, PAGE_READWRITE
		call VirtualAlloc
		add rsp, 32

		mov byte ptr [rax], " "
		mov byte ptr [rax+1], " "
		mov byte ptr [rax+2], "H"
		mov byte ptr [rax+3], "e"
		mov byte ptr [rax+4], "l"
		mov byte ptr [rax+5], "l"
		mov byte ptr [rax+6], "o"
		mov byte ptr [rax+7], "!"
		mov byte ptr [rax+8], " "
		mov byte ptr [rax+9], " "
		mov byte ptr [rax+10], CHAR_NULLBYTE

		push rax
		sub rsp, 32
		mov rcx, rax
		call TrimWhitespace
		add rsp, 32
		pop rcx

		sub rsp, 32
		mov rdx, 11
		mov r8, MEM_RELEASE
		call VirtualFree
		add rsp, 32

		sub rsp, 32
		mov rcx, EXIT_CODE_SUCCESS
		call ExitProcess

	main endp

end