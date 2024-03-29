00000000  FA                cli
00000001  31C0              xor ax,ax
00000003  8ED0              mov ss,ax
00000005  BCEC7B            mov sp,0x7bec
00000008  89E5              mov bp,sp
0000000A  8ED8              mov ds,ax
0000000C  BE007C            mov si,0x7c00
0000000F  8EC0              mov es,ax
00000011  BF0006            mov di,0x600
00000014  B90001            mov cx,0x100
00000017  FC                cld
00000018  F3A5              rep movsw
0000001A  EA1F060000        jmp word 0x0:0x61f
0000001F  30C0              xor al,al
00000021  38C2              cmp dl,al
00000023  7502              jnz 0x27
00000025  B280              mov dl,0x80
00000027  885612            mov [bp+0x12],dl
0000002A  BE9007            mov si,0x790
0000002D  BF2007            mov di,0x720
00000030  FFD7              call di
00000032  BEBE07            mov si,0x7be
00000035  B90400            mov cx,0x4
00000038  B480              mov ah,0x80
0000003A  30C0              xor al,al
0000003C  8A5C00            mov bl,[si+0x0]
0000003F  38DC              cmp ah,bl
00000041  7413              jz 0x56
00000043  38D8              cmp al,bl
00000045  751F              jnz 0x66
00000047  81C61000          add si,0x10
0000004B  49                dec cx
0000004C  75EE              jnz 0x3c
0000004E  BE3307            mov si,0x733
00000051  BFFD06            mov di,0x6fd
00000054  FFD7              call di
00000056  89F7              mov di,si
00000058  81C61000          add si,0x10
0000005C  49                dec cx
0000005D  740F              jz 0x6e
0000005F  8A5C00            mov bl,[si+0x0]
00000062  38DC              cmp ah,bl
00000064  75F2              jnz 0x58
00000066  BE4A07            mov si,0x74a
00000069  BFFD06            mov di,0x6fd
0000006C  FFD7              call di
0000006E  B441              mov ah,0x41
00000070  BBAA55            mov bx,0x55aa
00000073  8A5612            mov dl,[bp+0x12]
00000076  CD13              int 0x13
00000078  7250              jc 0xca
0000007A  81FB55AA          cmp bx,0xaa55
0000007E  754A              jnz 0xca
00000080  81E10100          and cx,0x1
00000084  7444              jz 0xca
00000086  C6460010          mov byte [bp+0x0],0x10
0000008A  C6460100          mov byte [bp+0x1],0x0
0000008E  C6460201          mov byte [bp+0x2],0x1
00000092  C6460300          mov byte [bp+0x3],0x0
00000096  C74604007C        mov word [bp+0x4],0x7c00
0000009B  C746060000        mov word [bp+0x6],0x0
000000A0  8B850800          mov ax,[di+0x8]
000000A4  89860800          mov [bp+0x8],ax
000000A8  8B850A00          mov ax,[di+0xa]
000000AC  89860A00          mov [bp+0xa],ax
000000B0  C7460C0000        mov word [bp+0xc],0x0
000000B5  C7460E0000        mov word [bp+0xe],0x0
000000BA  89EE              mov si,bp
000000BC  B442              mov ah,0x42
000000BE  CD13              int 0x13
000000C0  7324              jnc 0xe6
000000C2  BE5607            mov si,0x756
000000C5  BFFD06            mov di,0x6fd
000000C8  FFD7              call di
000000CA  8A7501            mov dh,[di+0x1]
000000CD  8B8D0200          mov cx,[di+0x2]
000000D1  B80102            mov ax,0x201
000000D4  8A5612            mov dl,[bp+0x12]
000000D7  BB007C            mov bx,0x7c00
000000DA  CD13              int 0x13
000000DC  7308              jnc 0xe6
000000DE  BE5607            mov si,0x756
000000E1  BFFD06            mov di,0x6fd
000000E4  FFD7              call di
000000E6  BB007C            mov bx,0x7c00
000000E9  8B87FE01          mov ax,[bx+0x1fe]
000000ED  81F855AA          cmp ax,0xaa55
000000F1  7507              jnz 0xfa
000000F3  89FE              mov si,di
000000F5  EA007C0000        jmp word 0x0:0x7c00
000000FA  BE6007            mov si,0x760
000000FD  BF2007            mov di,0x720
00000100  FFD7              call di
00000102  BE6C07            mov si,0x76c
00000105  BF2007            mov di,0x720
00000108  FFD7              call di
0000010A  31C0              xor ax,ax
0000010C  CD16              int 0x16
0000010E  31DB              xor bx,bx
00000110  8EC3              mov es,bx
00000112  BB7204            mov bx,0x472
00000115  B83412            mov ax,0x1234
00000118  268907            mov [es:bx],ax
0000011B  EA0000FFFF        jmp word 0xffff:0x0
00000120  60                pushaw
00000121  31DB              xor bx,bx
00000123  AC                lodsb
00000124  08C0              or al,al
00000126  7409              jz 0x131
00000128  B40E              mov ah,0xe
0000012A  CD10              int 0x10
0000012C  AC                lodsb
0000012D  08C0              or al,al
0000012F  75F7              jnz 0x128
00000131  61                popaw
00000132  C3                ret
00000133  4E                dec si
00000134  6F                outsw
00000135  206163            and [bx+di+0x63],ah
00000138  7469              jz 0x1a3
0000013A  7665              jna 0x1a1
0000013C  20656E            and [di+0x6e],ah
0000013F  7472              jz 0x1b3
00000141  7920              jns 0x163
00000143  696E204D42        imul bp,[bp+0x20],word 0x424d
00000148  52                push dx
00000149  00496E            add [bx+di+0x6e],cl
0000014C  7661              jna 0x1af
0000014E  6C                insb
0000014F  6964204D42        imul sp,[si+0x20],word 0x424d
00000154  52                push dx
00000155  00492F            add [bx+di+0x2f],cl
00000158  4F                dec di
00000159  206572            and [di+0x72],ah
0000015C  726F              jc 0x1cd
0000015E  7200              jc 0x160
00000160  49                dec cx
00000161  6E                outsb
00000162  7661              jna 0x1c5
00000164  6C                insb
00000165  6964205042        imul sp,[si+0x20],word 0x4250
0000016A  53                push bx
0000016B  000D              add [di],cl
0000016D  0A5072            or dl,[bx+si+0x72]
00000170  657373            gs jnc 0x1e6
00000173  20616C            and [bx+di+0x6c],ah
00000176  6D                insw
00000177  6F                outsw
00000178  7374              jnc 0x1ee
0000017A  20616E            and [bx+di+0x6e],ah
0000017D  7920              jns 0x19f
0000017F  6B657920          imul sp,[di+0x79],byte +0x20
00000183  746F              jz 0x1f4
00000185  207265            and [bp+si+0x65],dh
00000188  626F6F            bound bp,[bx+0x6f]
0000018B  742E              jz 0x1bb
0000018D  2E2E004D42        add [cs:di+0x42],cl
00000192  52                push dx
00000193  2E2E2E0000        add [cs:bx+si],al
00000198  0000              add [bx+si],al
0000019A  0000              add [bx+si],al
0000019C  0000              add [bx+si],al
0000019E  0000              add [bx+si],al
000001A0  0000              add [bx+si],al
000001A2  0000              add [bx+si],al
000001A4  0000              add [bx+si],al
000001A6  0000              add [bx+si],al
000001A8  0000              add [bx+si],al
000001AA  0000              add [bx+si],al
000001AC  0000              add [bx+si],al
000001AE  0000              add [bx+si],al
000001B0  0000              add [bx+si],al
000001B2  0000              add [bx+si],al
000001B4  0000              add [bx+si],al
000001B6  0000              add [bx+si],al
000001B8  0000              add [bx+si],al
000001BA  0000              add [bx+si],al
000001BC  0000              add [bx+si],al
000001BE  800101            add byte [bx+di],0x1
000001C1  0039              add [bx+di],bh
000001C3  0FFF              ud0
000001C5  DF3F              fistp qword [bx]
000001C7  0000              add [bx+si],al
000001C9  00C1              add cl,al
000001CB  41                inc cx
000001CC  0F0000            sldt [bx+si]
000001CF  0000              add [bx+si],al
000001D1  0000              add [bx+si],al
000001D3  0000              add [bx+si],al
000001D5  0000              add [bx+si],al
000001D7  0000              add [bx+si],al
000001D9  0000              add [bx+si],al
000001DB  0000              add [bx+si],al
000001DD  0000              add [bx+si],al
000001DF  0000              add [bx+si],al
000001E1  0000              add [bx+si],al
000001E3  0000              add [bx+si],al
000001E5  0000              add [bx+si],al
000001E7  0000              add [bx+si],al
000001E9  0000              add [bx+si],al
000001EB  0000              add [bx+si],al
000001ED  0000              add [bx+si],al
000001EF  0000              add [bx+si],al
000001F1  0000              add [bx+si],al
000001F3  0000              add [bx+si],al
000001F5  0000              add [bx+si],al
000001F7  0000              add [bx+si],al
000001F9  0000              add [bx+si],al
000001FB  0000              add [bx+si],al
000001FD  0055AA            add [di-0x56],dl
