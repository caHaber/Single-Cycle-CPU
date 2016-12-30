.text

.balign 4

setup:
        mov sp, #128
        add sp, sp, sp
        add sp, sp, sp

        /* put ints onto array on stack */
        sub sp, sp, #4
        mov r0, #1
        str r0, [sp]
        sub sp, sp, #4
        mov r0, #2
        str r0, [sp]
        sub sp, sp, #4
        mov r0, #3
        str r0, [sp]
        sub sp, sp, #4
        mov r0, #4
        str r0, [sp] 
        sub sp, sp, #4
        mov r0, #5
        str r0, [sp]
       
        /* setup args */
        mov r0, sp
        mov r1, #5
        bl sum_array
done:
        b done
sum_array:  
        mov r2, #0 /*r2 will be i initialized at zero*/
        mov r3, #0 /*r3 will be sum, also init at zero*/
loop:
        cmp r1, r2
        beq exit
        mov r12, #0
        ldr r12, [r0] /*r12 is the temp variable I load int at r0 address into*/
        add r3, r3, r12
        add r0, r0, #4 /*Increament address by 4*/
        add r2, r2, #1 /*Increament i by 1*/
        b loop
exit:
        mov r0, r3
        bx lr
