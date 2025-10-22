cpuid		; 从这里开始获取CPUID
mov     dword ptr [rsp+2D0h+modinfo.lpBaseOfDll+4], ebx
mov     ebx, eax
mov     [rsp+2D0h+modinfo.SizeOfImage], ecx
mov     ecx, eax
mov     dword ptr [rsp+2D0h+modinfo.EntryPoint], edx
mov     edx, eax
sar     ebx, 4
sar     ecx, 8
and     ebx, 0Fh
sar     edx, 10h
and     ecx, 0Fh
and     edx, 0Fh
cmp     ecx, 0Fh
jnz     short loc_13FA918A1

sar     eax, 14h
movzx   eax, al
add     ecx, eax

loc_13FA918A1:
cmp     ecx, 6
jz      short loc_13FA918AB

cmp     ecx, 0Fh
jnz     short loc_13FA918B0

loc_13FA918AB:
shl     edx, 4
add     ebx, edx

loc_13FA918B0:
movzx   r8d, [rbp+1D0h+Buf]
mov     edx, ecx
mov     eax, ecx
shl     rax, 20h
mov     ecx, ebx
xor     ebx, ebx
or      rax, rcx
lea     r10d, [rdx+rax]
lea     r9d, [rdx+rax]
xor     edx, edx
test    r8b, r8b
jz      short loc_13FA918FC ; 判断rb8是否有值没值就跳转

lea     rax, [rbp+1D0h+Buf]
nop     dword ptr [rax]

loc_13FA918E0:
movsx   ecx, r8b
lea     rax, [rax+1]
xor     ecx, edx
inc     edx
xor     ecx, r9d
add     ebx, ecx
movzx   ecx, byte ptr [rax]
movzx   r8d, cl
test    cl, cl
jnz     short loc_13FA918E0

loc_13FA918FC:
lea     eax, [r10+5E1h]
cmp     ebx, eax        ; eax = 0x69E 这里以eax为0x69E为例
jz      short loc_13FA91946