#store subsequent items in the static segment at avalible address. We can use memory in simulator to check address
.data
.word 2, 4, 6, 8
#Define a label 'n' that points to a space in memory initiazed with integer 9. We can also check it in memory, Data section.  
n: .word 9

#Store subsequent instructuons in the text segment at the next avalible address
.text
main:   
    add t0, x0, x0
    addi t1, x0, 1
    #The la pseudo-instruction typically expands to a sequence of instructions to load a full address into a register, because immediate values that 
    #can be loaded directly into a register in a single instruction are limited in size due to the fixed length of RISC-V instructions. For most purposes,
    #la is expanded into a pair of instructions: LUI (Load Upper Immediate) and an ADDI (ADD Immediate) or ORI (OR Immediate), depending on the specific 
    #requirements and context
    la t3, n
    lw t3, 0(t3)
fib:    
    beq t3, x0, finish
    add t2, t1, t0
    mv t0, t1
    mv t1, t2
    addi t3, t3, -1  
    j fib
finish: 
    addi a0, x0, 1
    addi a1, t0, 0
    ecall # print integer ecall
    addi a0, x0, 10
    ecall # terminate ecall
#The output of this file is 34 which is 9th element of fib sequence