      .data
str:  .asciz "*****Input ID*****\n"
id1:  .asciz "** Please Enter Member 1 ID:**\n"
id2:  .asciz "** Please Enter Member 2 ID:**\n"
id3:  .asciz "** Please Enter Member 3 ID:**\n"
com:  .asciz "** Please Enter Command **\n"
tol:  .asciz "*****Print Team Member ID and ID Summation*****\n"
sum:  .asciz "\nID Summation = %d\n"
end:  .asciz "*****End Print*****\n"
pd:   .asciz "%d"
ln:   .asciz "\n"
ps:   .asciz "%s"
coms: .asciz "p"
comw: .word  0
a:    .word  0
b:    .word  0
c:    .word  0
tid:  .word  0

      .text
      .globl id
      .globl tid
      .globl loop

id:   stmfd sp!,{lr}
      ldr   r0, =str
      bl    printf

      ldr   r0, =id1
      subs  r1, pc, lr
      bl    printf
      ldr   r0, =pd
      ldr   r1, =a
      bl    scanf

      ldr   r0, =id2
      bl    printf
      ldr   r0, =pd
      ldr   r1, =b
      bl    scanf

      ldr   r0, =id3
      bl    printf
      ldr   r0, =pd
      ldr   r1, =c
      bl    scanf

loop: ldr   r0, =com
      bl    printf
      ldr   r0, =ps
      ldr   r1, =comw
      bl    scanf

      ldr   r0, =coms
      ldrb  r0, [r0]
      ldr   r1, =comw
      ldrh  r1, [r1]
      cmp   r0, r1
      beq   prtid
      b     loop

prtid:
      ldr   r0, =tol
      bl    printf
      ldr   r0, =pd
      ldr   r1, =a
      ldr   r1, [r1]
      bl    printf
      ldr   r0, =ln
      bl    printf

      ldr   r0, =pd
      ldr   r1, =b
      ldr   r1, [r1]
      bl    printf
      ldr   r0, =ln
      bl    printf

      ldr   r0, =pd
      ldr   r1, =c
      ldr   r1, [r1]
      bl    printf
      ldr   r0, =ln
      bl    printf
      ldr   r0, =ln
      bl    printf

      ldr   r0, =a
      ldr   r0, [r0]
      ldr   r2, =b
      ldr   r2, [r2]
      cmp   r0, r2
      addne   r1, r0, r2
      ldr   r0, =c
      ldr   r0, [r0]
      cmp   r1, r0
      addge   r1, r1, r0
      ldr   r7, =tid
      str   r1, [r7]
      ldr   r0, =sum
      bl    printf
      ldr   r0, =end
      bl    printf
      mov   r0, #0 
      mov   r1, #0 
      mov   r2, #0 
      mov   r3, #0 
      mov   r7, #0  
      ldmfd sp!,{lr}
      mov   pc, lr





