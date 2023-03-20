.data #please note that i have defined some things with lines in comments so don't shift lines
A: .word 1,1,1,1
b: .word 1,1
x: .word 1,1
adding: .word 0,0
multible: .word 0,0
store: .word 0,0,0,0
.text


main:
la $a0, A #passing  2x2 matrix parameter
la $a1, b#passing  2x1 matrix b parameter
la $a2, x#passing  2x1 matrix x parameter
jal lin_alg#jump and link lin_alg 
add $s5 ,$v0,$zero#result
j Exit #jump to terminate 


lin_alg:
addi $t0, $zero, 1 # Setting variable for The LOOP
addi $sp ,$sp ,-4#adjusting Stack pointer to make room for one place
sw $ra, 0($sp)#storing return addresse as it would be overridden in stack 
la $a1, b#passing parameter to add
la $a2, x#passing parameter to add
jal add_vec
add $s0, $v0, $zero# Z= add_vec( B , X )
la $a1, A #passing parameter to mul
add $a2 ,$s0 ,$zero #passing parameter to mul


jal mul_matrix
addi $s1 , $v0,0# result = mul( A , Z ) 
add $v1 ,$s1 ,$zero #return result 
lw $ra ,0($sp) #returning the value of $ra that call
addi $sp,$sp ,4 #poping them inside the stack 
jr $ra #return address






add_vec:
addi $t0, $zero, 1 #$t0 is counter for the loop
la $a1, b#take b matrix as an input in $a1
la $a2, x#take x matrix as an input in $a2
la $t4, adding#$t4 to store the resultant matrix
add $v0, $zero, $t4#return the resultant matrix
L1:  #start of loop
lw $t5, 0($a1)# loading first element of matrix b in $t5  
lw $t6, 0($a2)# loading first element of matrix x in $t6
add $t3, $t6,$t5 #adding $t6 and $t5 in $t3
sw $t3, 0($t4) #storing result of 2 add element in $t3  
beq $t0,$zero, finish#checking the condition of loop 
addi $t0, $t0, -1#decrement counter of loop
addi $a1, $a1, 4 #shifting to second element in matrix b
addi $a2, $a2, 4#shifting to second element in matrix x
addi $t4, $t4, 4 #shifting to store in second element of the resultant matrix
j L1 #unconditional jump to the loop note the loop will be repeated 2 times as it is result of adding 2x1 matrix and adding 2x1 matrix 
finish: #when loop is terminated it would jump here
jr $ra# return to the place where the function is called



mul_matrix:# matrix multiplication
la $a0, A #loading 2x2 matrix as an input for $a0
la $a1, adding#loading 2x1 resultant matrix from add_vec as an input for $a1
la $t4, multible#loading resultant matrix from this method in $t4
la $t7, store 
addi $t0, $zero, 1#counter for the loop
add $v0, $zero, $t4#returning the resultant matrix 
L2: 
lw $t1, 0($a0)#loading first element in row 1 and column 1 from 2x2 (A)matrix in $t1
lw $t4, 0($a1)#loading first element from 2x1 (resultant from adding)matrix in $t4
mul $t5, $t1,$t4#storing in $t5 the resultant from multipling  $t1 and $t4 which where defined in row 74 and 75  
lw $t1, 4($a0) #loading first element in row 1 and column 2 from 2x2 (A)matrix in $t1
lw $t4, 4($a1)#loading second element from 2x1 (resultant from adding)matrix in $t4
mul $t6, $t1,$t4#storing in $t6 the resultant from multipling  $t1 and $t4 which where defined in row 77 and 78 

add $t3, $t5,$t6#adding them the resultant of multiplication process in row 76 and 79  and store them in $t3

sw $t3, 0($t7)#storing in $t7 which is final value the result ($t3)
beq $t0,$zero, finish2 #checking the condition of loop which it would repeated for 2 times
addi $t0, $t0, -1#decremnting the counter 
addi $t7, $t7, 4#shifting the storing place to call the matrix
addi $a0, $a0, 8#Shifting to the second row and call the method   
j L2 #jump to repeat the loop 
finish2: #after repeating the loop for 2 times we will jump here
addi $t7,$t7,-4
add $v0,$zero, $t7#return the result of mutiplicated matrix
jr $ra # jump to return address


Exit: 
la $a1, store
lw $t0, 0($a1)
lw $t1, 4($a1)