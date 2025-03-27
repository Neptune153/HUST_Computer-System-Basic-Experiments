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
    push edi
    mov esi, [sptr]         ; ѧ�������ַ
    mov ecx, [num]          ; ѧ������

loop_students:
    xor eax, eax            ; �ܷ�����
    lea edi, [esi].student.scores+1 ; scores�����ַ
    mov edx, 8              ; ѭ��������

score_loop:
    add ax, word ptr [edi]  ; �ۼӷ���
    add edi, 2              ; �ƶ�����һ������
    dec edx
    jnz score_loop

    
    xor edx, edx            ; ����DX��ȷ��������ΪDX:AX = 0:sum
    mov bx, 8               ; ����
    div bx                  ; ax = sum / 8��������DX

    mov [esi].student.average+1, ax ; �洢ƽ����
    add esi, 38             ; �ƶ�����һ��ѧ����ÿ��ѧ��38�ֽڣ�
    dec ecx
    jnz loop_students

    pop edi
    pop esi
    ret
computeAverageScore endp
end