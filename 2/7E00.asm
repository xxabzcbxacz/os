00000000  EB3C              jmp short 0x3e
00000002  90                nop
00000003  50                push ax
00000004  6C                insb
00000005  61                popaw
00000006  6E                outsb
00000007  392E3030          cmp [0x3030],bp
0000000B  0002              add [bp+si],al
0000000D  0402              add al,0x2
0000000F  0002              add [bp+si],al
00000011  0002              add [bp+si],al
00000013  0000              add [bx+si],al
00000015  F8                clc
00000016  C8003F00          enter 0x3f00,0x0
0000001A  1000              adc [bx+si],al
0000001C  3F                aas
0000001D  0000              add [bx+si],al
0000001F  0000              add [bx+si],al
00000021  2003              and [bp+di],al
00000023  00800029          add [bx+si+0x2900],al
00000027  D101              rol word [bx+di],1
00000029  0000              add [bx+si],al
0000002B  43                inc bx
0000002C  59                pop cx
0000002D  4C                dec sp
0000002E  49                dec cx
0000002F  4E                dec si
00000030  44                inc sp
00000031  52                push dx
00000032  49                dec cx
00000033  43                inc bx
00000034  41                inc cx
00000035  4C                dec sp
00000036  46                inc si
00000037  41                inc cx
00000038  54                push sp
00000039  31362020          xor [0x2020],si
0000003D  skipping 0x1 bytes
0000003E  FA                cli
0000003F  31C0              xor ax,ax
00000041  8ED0              mov ss,ax
00000043  8ED8              mov ds,ax
00000045  8EC0              mov es,ax
00000047  BCEC7B            mov sp,0x7bec
0000004A  89E5              mov bp,sp
0000004C  885612            mov [bp+0x12],dl
0000004F  50                push ax
00000050  B8557C            mov ax,0x7c55
00000053  50                push ax
00000054  CB                retf
00000055  FB                sti
00000056  BEE77D            mov si,0x7de7
00000059  BF967D            mov di,0x7d96
0000005C  FFD7              call di
0000005E  BF887D            mov di,0x7d88
00000061  FFD7              call di
00000063  8B06277C          mov ax,[0x7c27]
00000067  8B16297C          mov dx,[0x7c29]
0000006B  BB007E            mov bx,0x7e00
0000006E  BF327D            mov di,0x7d32
00000071  FFD7              call di
00000073  BB1000            mov bx,0x10
00000076  BF007E            mov di,0x7e00
00000079  57                push di
0000007A  BEDB7D            mov si,0x7ddb
0000007D  B90B00            mov cx,0xb
00000080  F3A6              repe cmpsb
00000082  5F                pop di
00000083  740E              jz 0x93
00000085  4B                dec bx
00000086  7406              jz 0x8e
00000088  81C72000          add di,0x20
0000008C  EBEB              jmp short 0x79
0000008E  BF147D            mov di,0x7d14
00000091  FFD7              call di
00000093  31DB              xor bx,bx
00000095  8B06117C          mov ax,[0x7c11]
00000099  B92000            mov cx,0x20
0000009C  F7E1              mul cx
0000009E  8B0E0B7C          mov cx,[0x7c0b]
000000A2  51                push cx
000000A3  49                dec cx
000000A4  01C8              add ax,cx
000000A6  11DA              adc dx,bx
000000A8  59                pop cx
000000A9  F7F1              div cx
000000AB  50                push ax
000000AC  8B851A00          mov ax,[di+0x1a]
000000B0  48                dec ax
000000B1  48                dec ax
000000B2  8A0E0D7C          mov cl,[0x7c0d]
000000B6  30ED              xor ch,ch
000000B8  F7E1              mul cx
000000BA  8B0E277C          mov cx,[0x7c27]
000000BE  01C8              add ax,cx
000000C0  8B0E297C          mov cx,[0x7c29]
000000C4  11CA              adc dx,cx
000000C6  59                pop cx
000000C7  01C8              add ax,cx
000000C9  11DA              adc dx,bx
000000CB  50                push ax
000000CC  52                push dx
000000CD  8B851C00          mov ax,[di+0x1c]
000000D1  8B951E00          mov dx,[di+0x1e]
000000D5  8B0E0B7C          mov cx,[0x7c0b]
000000D9  51                push cx
000000DA  49                dec cx
000000DB  01C8              add ax,cx
000000DD  11DA              adc dx,bx
000000DF  59                pop cx
000000E0  F7F1              div cx
000000E2  89C1              mov cx,ax
000000E4  5A                pop dx
000000E5  58                pop ax
000000E6  BB0010            mov bx,0x1000
000000E9  8EC3              mov es,bx
000000EB  BB0000            mov bx,0x0
000000EE  BF327D            mov di,0x7d32
000000F1  FFD7              call di
000000F3  8B3E0B7C          mov di,[0x7c0b]
000000F7  01FB              add bx,di
000000F9  7308              jnc 0x103
000000FB  8CC7              mov di,es
000000FD  81C70010          add di,0x1000
00000101  8EC7              mov es,di
00000103  31FF              xor di,di
00000105  40                inc ax
00000106  11FA              adc dx,di
00000108  E2E4              loop 0xee
0000010A  BF0010            mov di,0x1000
0000010D  8EDF              mov ds,di
0000010F  EA00000010        jmp word 0x1000:0x0
00000114  BEA97D            mov si,0x7da9
00000117  BF967D            mov di,0x7d96
0000011A  FFD7              call di
0000011C  31C0              xor ax,ax
0000011E  CD16              int 0x16
00000120  31DB              xor bx,bx
00000122  8EC3              mov es,bx
00000124  BB7204            mov bx,0x472
00000127  B83412            mov ax,0x1234
0000012A  268907            mov [es:bx],ax
0000012D  EA0000FFFF        jmp word 0xffff:0x0
00000132  BF0500            mov di,0x5
00000135  60                pushaw
00000136  53                push bx
00000137  8B1E187C          mov bx,[0x7c18]
0000013B  8B3E1A7C          mov di,[0x7c1a]
0000013F  0FAFDF            imul bx,di
00000142  09DB              or bx,bx
00000144  7436              jz 0x17c
00000146  F7F3              div bx
00000148  89C1              mov cx,ax
0000014A  C1C108            rol cx,0x8
0000014D  C0E106            shl cl,0x6
00000150  89D0              mov ax,dx
00000152  31D2              xor dx,dx
00000154  8B1E187C          mov bx,[0x7c18]
00000158  F7F3              div bx
0000015A  42                inc dx
0000015B  81E23F00          and dx,0x3f
0000015F  09D1              or cx,dx
00000161  89C2              mov dx,ax
00000163  C1E208            shl dx,0x8
00000166  8A5612            mov dl,[bp+0x12]
00000169  5B                pop bx
0000016A  B80102            mov ax,0x201
0000016D  CD13              int 0x13
0000016F  7315              jnc 0x186
00000171  61                popaw
00000172  4F                dec di
00000173  7407              jz 0x17c
00000175  BF887D            mov di,0x7d88
00000178  FFD7              call di
0000017A  EBB9              jmp short 0x135
0000017C  BEB77D            mov si,0x7db7
0000017F  BF967D            mov di,0x7d96
00000182  FFD7              call di
00000184  EB96              jmp short 0x11c
00000186  61                popaw
00000187  C3                ret
00000188  60                pushaw
00000189  31C0              xor ax,ax
0000018B  8A5612            mov dl,[bp+0x12]
0000018E  CD13              int 0x13
00000190  08E4              or ah,ah
00000192  61                popaw
00000193  75E7              jnz 0x17c
00000195  C3                ret
00000196  60                pushaw
00000197  31DB              xor bx,bx
00000199  AC                lodsb
0000019A  08C0              or al,al
0000019C  7409              jz 0x1a7
0000019E  B40E              mov ah,0xe
000001A0  CD10              int 0x10
000001A2  AC                lodsb
000001A3  08C0              or al,al
000001A5  75F7              jnz 0x19e
000001A7  61                popaw
000001A8  C3                ret
000001A9  42                inc dx
000001AA  61                popaw
000001AB  6420666F          and [fs:bp+0x6f],ah
000001AF  726D              jc 0x21e
000001B1  61                popaw
000001B2  7420              jz 0x1d4
000001B4  6F                outsw
000001B5  7220              jc 0x1d7
000001B7  49                dec cx
000001B8  2F                das
000001B9  4F                dec di
000001BA  206572            and [di+0x72],ah
000001BD  726F              jc 0x22e
000001BF  720D              jc 0x1ce
000001C1  0A5072            or dl,[bx+si+0x72]
000001C4  657373            gs jnc 0x23a
000001C7  206120            and [bx+di+0x20],ah
000001CA  6B657920          imul sp,[di+0x79],byte +0x20
000001CE  746F              jz 0x23f
000001D0  207265            and [bp+si+0x65],dh
000001D3  626F6F            bound bp,[bx+0x6f]
000001D6  742E              jz 0x206
000001D8  2E2E0039          add [cs:bx+di],bh
000001DC  4C                dec sp
000001DD  4F                dec di
000001DE  41                inc cx
000001DF  44                inc sp
000001E0  2020              and [bx+si],ah
000001E2  2020              and [bx+si],ah
000001E4  2020              and [bx+si],ah
000001E6  005042            add [bx+si+0x42],dl
000001E9  53                push bx
000001EA  312E2E2E          xor [0x2e2e],bp
000001EE  0000              add [bx+si],al
000001F0  0000              add [bx+si],al
000001F2  0000              add [bx+si],al
000001F4  0000              add [bx+si],al
000001F6  0000              add [bx+si],al
000001F8  0000              add [bx+si],al
000001FA  0000              add [bx+si],al
000001FC  0000              add [bx+si],al
000001FE  55                push bp
000001FF  AA                stosb
