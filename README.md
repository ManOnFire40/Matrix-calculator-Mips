# Matrix-calculator-Mips



1 Overview
Linear algebra provides concepts that are crucial to many areas of computer science, including graphics,
image processing, cryptography, machine learning, computer vision,information retrieval and web search.
Accordingly, computers must be able to perform Linear algebra’s operations.
2 Project Description
In this project, we’ll perform a simple linear algebra operation on MIPS architecture using MARS, which is
y = A(x + b), where x, y and b are 2 × 1 vectors and A is a 2 × 2 matrix.
Assume that A matrix, x and b vectors are initially stored in the memory before running your assembly
instructions, to make this assumption valid refer to section 5.

3 Deliverables
1. MIPS assembly code contains:
(a) main() function which performs the following:
• Calls lin alg() function (passing base addresses of A, x and b as arguments).
(b) lin alg() non-leaf function which performs the following:
• Calls add vec() function (passing base addresses of x and b as arguments).
• Calls mul matrix() function (passing base addresses of A and (x + b) as arguments).
• Returns the base address of the resulted vector.
(c) add vec() leaf function which performs the following:
• Add the two vectors x and b.
• Returns the base address of the resulted vector.
(d) mul matrix() leaf function which performs the following:
• Multiplies the matrix A by the vector (x + b).
• Returns the base address of the resulted vector.





