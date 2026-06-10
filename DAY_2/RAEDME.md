# Day 02 - Logic Gates, Boolean Laws and Gray Code

## Date

02-06-2026

## Topics Covered

### 1. Logic Gates

Logic gates are the fundamental building blocks of digital circuits. They operate on binary inputs (0 and 1) and produce binary outputs.

#### AND Gate

Expression:

A.B

Truth:

* Output is HIGH only when all inputs are HIGH.
* Used for enabling and control operations.

#### OR Gate

Expression:

A + B

Truth:

* Output is HIGH if at least one input is HIGH.

#### NOT Gate

Expression:

A'

Truth:

* Produces the complement of the input.
* 0 becomes 1 and 1 becomes 0.

#### NAND Gate

Expression:

(A.B)'

Truth:

* Complement of AND gate.
* Universal gate.

#### NOR Gate

Expression:

(A+B)'

Truth:

* Complement of OR gate.
* Universal gate.

#### XOR Gate

Expression:

A ⊕ B

Truth:

* Output is HIGH when inputs are different.
* Used in adders and parity generation.

#### XNOR Gate

Expression:

(A ⊕ B)'

Truth:

* Output is HIGH when inputs are equal.
* Used in comparators and equality checking.

---

### 2. Basic Boolean Laws

#### Identity Law

A + 0 = A

A . 1 = A

#### Null Law

A + 1 = 1

A . 0 = 0

#### Idempotent Law

A + A = A

A . A = A

#### Complement Law

A + A' = 1

A . A' = 0

#### Double Negation Law

(A')' = A

#### Commutative Law

A + B = B + A

A.B = B.A

#### Associative Law

(A+B)+C = A+(B+C)

(A.B).C = A.(B.C)

#### Distributive Law

A(B+C) = AB + AC

A + BC = (A+B)(A+C)

---

### 3. Important Simplification Rule

#### Absorption Law

A(A+B) = A

A + AB = A

Key Idea:

* Once A is true, the value of the additional term becomes irrelevant.
* Helps eliminate unnecessary logic and reduce circuit complexity.

Examples:

A(A+B+C) = A

A + A(B+C) = A

This law is frequently used during Boolean simplification and K-Map reduction.

---

### 4. Consensus Theorem

Expression:

AB + A'C + BC = AB + A'C

Here:

BC is called the Consensus Term.

Observation:

* The term BC does not affect the final output.
* Therefore it can be removed.

Advantages:

* Reduces hardware requirements.
* Simplifies logic expressions.
* Minimizes gate count.

---

### 5. Minterms

* A minterm is a product term containing all variables exactly once.
* Represents rows where the output is 1.

For variables A and B:

m0 = A'B'

m1 = A'B

m2 = AB'

m3 = AB

Example:

F(A,B) = Σ(1,3)

means output is HIGH for minterms 1 and 3.

---

### 6. Maxterms

* A maxterm is a sum term containing all variables exactly once.
* Represents rows where the output is 0.

For variables A and B:

M0 = A + B

M1 = A + B'

M2 = A' + B

M3 = A' + B'

Example:

F(A,B) = Π(0,2)

means output is LOW for maxterms 0 and 2.

---

### 7. Gray Code

Gray code is a binary numbering system in which only one bit changes between adjacent numbers.

Example:

Binary:

000

001

010

011

100

Gray Code:

000

001

011

010

110

111

101

100

---

### 8. Why Gray Code?

Problem with Binary:

When moving between adjacent binary values, multiple bits may change simultaneously.

Example:

0111 → 1000

Four bits change at the same time.

This can cause:

* Glitches
* Timing errors
* Incorrect intermediate states

Advantage of Gray Code:

* Only one bit changes between adjacent values.
* Less power consumption because lesser switching.
* Minimizes transition errors.
* Improves reliability in digital systems.

Applications:

* Karnaugh Maps (K-Maps)
* Rotary Encoders
* Position Sensors
* Clock Domain Crossing (CDC)
* FSM

---

### 9. Why Gray Code is Used in K-Maps?

* Adjacent cells in a K-Map must differ by only one variable.
* Gray code ordering guarantees a single-bit change between neighboring cells.
* Makes grouping and simplification possible.
* Helps identify common terms easily.

Without Gray code ordering, Boolean simplification using K-Maps would not work correctly.

---

## 10. Gray to Binary Conversion

Gray code is often converted back to binary for processing in digital systems.

Rules:

* MSB of Binary = MSB of Gray
* Every subsequent Binary bit is obtained by XORing the previous Binary bit with the current Gray bit.

Example:

Gray = 1011

B3 = 1

B2 = B3 ⊕ G2 = 1 ⊕ 0 = 1

B1 = B2 ⊕ G1 = 1 ⊕ 1 = 0

B0 = B1 ⊕ G0 = 0 ⊕ 1 = 1

Binary = 1101

---

## 11. Implementing Buffer and NOT Gate using XOR

### XOR with Constant 0

Expression:

A ⊕ 0 = A

Observation:

* Output follows input.
* Behaves as a Buffer.

Truth Table:

| A | Y |
| - | - |
| 0 | 0 |
| 1 | 1 |

---

### XOR with Constant 1

Expression:

A ⊕ 1 = A'

Observation:

* Output becomes complement of input.
* Behaves as a NOT Gate.

Truth Table:

| A | Y |
| - | - |
| 0 | 1 |
| 1 | 0 |

---

## 12. Parity Generation and Detection

Parity is used for error detection in digital communication.

### Even Parity using XOR

* XOR outputs 1 when the number of 1's is odd.
* Additional parity bit is generated so that total number of 1's becomes even.

Example:

Data = 1011

Number of 1's = 3

Parity Bit = 1

Transmitted Data = 10111

Total 1's = 4 (Even)

---

### Odd Parity using XNOR

* XNOR outputs 1 when the number of 1's is already even.
* Additional parity bit ensures odd number of total 1's.

Used in communication systems for error detection.

---

## 13. Adders

Adders are combinational circuits used to perform binary addition.

### Half Adder

Inputs:

* A
* B

Outputs:

* Sum
* Carry

Equations:

Sum = A ⊕ B

Carry = A.B

Limitation:

* Cannot handle carry input from previous stage.

---

### Full Adder

Inputs:

* A
* B
* Cin

Outputs:

* Sum
* Cout

Equations:

Sum = A ⊕ B ⊕ Cin

Cout = AB + BCin + ACin

Advantage:

* Can add three bits simultaneously.
* Used to construct multi-bit adders.

---

## 14. Subtractors

### Half Subtractor

Inputs:

* A
* B

Outputs:

* Difference
* Borrow

Equations:

Difference = A ⊕ B

Borrow = A'B

---

### Half Subtractor using Half Adder

Observation:

Difference equation is identical to Half Adder Sum.

Difference = A ⊕ B

Borrow can be generated by:

Borrow = A'B

using an inverter and AND gate along with Half Adder output.

This demonstrates the relationship between addition and subtraction circuits.

---

## Tasks Assigned

### Task 1

Implement:

1. Binary Counter
2. Gray Code Counter

Objective:

* Observe counting sequence.
* Compare Binary and Gray transitions.

---

### Task 2

Majority Detector using Full Adder

Hint:

For a Full Adder:

Cout = AB + BCin + ACin

Observation:

Cout becomes HIGH when two or more inputs are HIGH.

Therefore:

Cout itself acts as a 3-input Majority Detector.

---

### Task 3

Study and Implement:

1. Serial Adder
2. Parallel Adder

Objective:

* Understand speed versus hardware trade-offs.
* Compare sequential and parallel addition techniques.

---

## Tasks Performed

* Studied the operation and truth tables of basic logic gates.
* Explored Boolean algebra laws and their role in logic simplification.
* Learned the Absorption Law and Consensus Theorem for reducing logic expressions.
* Understood the concepts of minterms and maxterms in Boolean function representation.
* Studied Gray code generation and Gray-to-Binary conversion techniques.
* Learned why Gray code is preferred in Karnaugh Maps and digital systems.
* Explored parity generation and error detection using XOR and XNOR gates.
* Understood how XOR can be used to implement Buffer and NOT operations.
* Studied the design and working of Half Adders, Full Adders, and Half Subtractors.
* Analyzed how Full Adder carry output can be used as a Majority Detector.


---

## Key Takeaways

* Logic gates are the fundamental building blocks of all digital circuits.
* Boolean algebra provides efficient methods for simplifying logic expressions.
* Absorption Law and Consensus Theorem help reduce hardware complexity.
* Minterms and maxterms provide standard representations of Boolean functions.
* Gray code ensures only one bit changes between adjacent values, minimizing transition errors.
* XOR and XNOR gates have important applications in parity generation and error detection.
* Adders form the basis of arithmetic operations in digital systems.
* Full Adder carry logic can be utilized to implement a Majority Detector.
* Proper logic simplification leads to reduced gate count, area, and power consumption.

* Minterms and maxterms are used to represent Boolean functions.
* Gray code minimizes transition errors and is essential in K-Map organization.
