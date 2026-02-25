    .data
con1:   .word 1500
con2:   .word 1000
con3:   .word 4000000
con4:   .word 0xff
con5:   .hword 0xffff
cX:     .word 0
cY:     .word 0
frame:  .word 0

    .text
    .globl drawJuliaSet

drawJuliaSet:
    stmfd sp!, {r4-r12, lr}

    ldr r5, =cX
    str r0, [r5]    @cX

    ldr r5, =cY
    str r1, [r5]    @cY

    ldr r5, =frame
    str r2, [r5]    @frame

    mov r1, lr
    add lr, r0, pc
    mov lr, r1
    cmp r1, lr
    moveq r4, #0          @r4=x,x=0

xloop:
    mov r6, #640        @r6=width
    cmp r4, r6          @if x<width?
    bge end
    movlt r5, #0        @r5=y,y=0
yloop:
    mov r7, #480        @r7=height
    cmp r5, r7          @if y<height?
    bge endyloop

    mov r8, r6, ASR #1
    sub r10, r4, r8     @r10=x-(width>>1)
    ldr r9, =con1
    ldr r9, [r9]
    mul r10, r10, r9
    mov r0, r10
    mov r1, r8
    bl  __aeabi_idiv
    mov r8, r0		@r8=zx
    mov r11, r7, ASR #1
    mov r9, #0
    sub r9, r5, r11
    mov r10, #1000
    mul r9, r9, r10
    mov r0, r9
    mov r1, r11
    bl  __aeabi_idiv
    mov r9, r0		@r9=zy
    mov r10, #255       @r10=i

while:
    mov r11, #0
    mul r12, r8, r8
    mul r11, r9, r9
    add r12, r12, r11      @r12=zx*zx+zy*zy
    ldr r11, =con3
    ldr r11, [r11]         @r1=4000000
    cmp r12, r11
    bge endwhile

    cmp r10, #0
    ble endwhile

    mul r11, r8, r8
    mul r12, r9, r9
    sub r11, r11, r12      @r11=zx*zx-zy*zy
    mov r0, r11
    mov r1, #1000
    bl __aeabi_idiv
    mov r11, r0
    ldr r0, =cX
    ldr r0, [r0]
    add r11, r11, r0	   @r11=tem
    mul r9, r8, r9
    mov r9, r9, LSL #1
    mov r0, r9
    mov r1, #1000
    bl __aeabi_idiv
    mov r9, r0
    ldr r1, =cY
    ldr r1, [r1]
    add r9, r9, r1
    mov r8, r11
    sub r10, r10, #1
    b while

endwhile:
    and r11, r10, #0xff    @r11=(i&0xff)
    mov r12, r11, LSL #8   @r12=((i&0xff)<<8)
    orr r11, r12, r11
    mvn r11, r11
    ldr r12, =con5
    ldr r12, [r12]
    and r11, r11, r12	   @r11=color
    mov r12, #640
    mul r12, r12, r5
    add r12, r12, r4
    mov r12, r12, LSL #1
    ldr r2, =frame
    ldr r2, [r2]
    add r2, r12, r2
    strh r11, [r2]
    add r5, r5, #1
    b yloop

endyloop:
    add r4, r4, #1
    b xloop

end:
    ldmfd sp!, {r4-r12, lr}
    mov r0, #0
    mov pc, lr
