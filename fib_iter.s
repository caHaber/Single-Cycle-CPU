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

        /* call sum_array */
        bl fib_iter_a
        /* end in infinite loop */
done:
        b done

fib_iter_a:
        mov r1, #0 /* fib 1*/
        mov r2, #1 /* fib 2*/
        mov r12, #2 /* i */
        cmp r0, r1 
        moveq r3, r1
        cmp r0, r2
        moveq r3, r2
loop:
        /*sub r3, r12, #1 */
        cmp r0, r12
        blt exit
        add r3, r1, r2
        mov r1, r2
        mov r2, r3
        add r12, r12, #1
        b loop
exit:
        mov r0, r3
        bx lr