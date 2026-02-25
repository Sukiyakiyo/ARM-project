    .data
head:.asciz "*****Print Name*****\n"
team:.asciz "Team num\n"
one: .asciz "name1\n"
two: .asciz "name2\n"
three:.asciz "name3\n"
end: .asciz "*****End Print*****\n"
    .text
    .global name
    .global team
    .global one
    .global two
    .global three
name:
    stmfd sp!,{lr}
    ldr r0, =head
    bl printf
    ldr r0, =team
    bl printf
    ldr r0, =one
    bl printf
    ldr r0, =two
    bl printf
    ldr r0, =three
    bl printf
    ldr r0, =end
    bl printf
    mov r0, #0
    ldmfd sp!,{lr}
    mov pc, lr
