.686P
.model flat, c
printf proto c :ptr sbyte, :vararg
includelib  libcmt.lib
includelib  legacy_stdio_definitions.lib 

student  struct
    sname   db   8 dup(0)      ; ѧ��������8�ֽ�
    sid     db   11 dup(0)     ; ѧ�ţ�11�ֽ�
    scores  dw   8 dup(0)      ; 8�ſεĳɼ���ÿ���ɼ�ռ2�ֽ�
    average dw   0             ; ƽ���ɼ���ռ2�ֽ�
student   ends

.code
; ����ƽ���ɼ�
; sptr ѧ��������׵�ַ
; num  ѧ������
computeAverageScore proc sptr: dword, num:dword
    push esi
    mov esi, [sptr]         ; ѧ�������ַ
    mov ecx, [num]          ; ѧ������

loop_students:
    xor ax, ax         
    add ax, word ptr [esi + 20]   
    add ax, word ptr [esi + 22]  
    add ax, word ptr [esi + 24]   
    add ax, word ptr [esi + 26]   
    add ax, word ptr [esi + 28]   
    add ax, word ptr [esi + 30]  
    add ax, word ptr [esi + 32]   
    add ax, word ptr [esi + 34]   

    shr ax, 3  
    mov [esi+36], ax  

    add esi, 38             
    dec ecx
    jnz loop_students

    pop esi
    ret  
computeAverageScore endp
end
;���ټĴ���ʹ�úͼ򻯵�ַ����