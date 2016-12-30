.text

.balign 4

setup:
        /* set sp to 1024 */
        mov sp, #128
        add sp, sp, sp
        add sp, sp, sp

        /* put ints onto array on stack */
        /* setup args */
        mov r0, #7
        bl fib_rec_a
done:
        b done
        
fib_rec_a:
        sub sp, sp, #4
        str r4, [sp]
        sub sp, sp, #4
        str r5, [sp]
        sub sp, sp, #4
        str lr, [sp]
        cmp r0, #0
        beq exit
        cmp r0, #1
        beq exit
fib_rec:
        mov r4, r0
        sub r0, r0, #1
        bl fib_rec_a
        mov r5, r0
        sub r0, r4, #2  
        bl fib_rec_a
        add r0, r0, r5
exit:
        ldr lr, [sp]
        add sp, sp, #4
        ldr r5, [sp]
        add sp, sp, #4
        ldr r4, [sp]
        add sp, sp, #4
        bx lr

