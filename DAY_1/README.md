# Day 01 - Introduction to FPGAs and Number Systems

## Date

01-06-2026

## Topics Covered

### 1. Introduction to FPGAs

* FPGA stands for **Field Programmable Gate Array**.
* It is a programmable integrated circuit that can be configured after manufacturing.
* The hardware functionality can be modified according to application requirements.
* FPGA consists of:

  * Logic Blocks
  * Look-Up Tables (LUTs)
  * Flip-Flops
  * Routing Resources
  * I/O Blocks
* Programming is done using Hardware Description Languages (HDLs) such as Verilog and VHDL.

---

### 2. FPGA vs Microcontroller

#### Microcontroller

* Executes instructions sequentially.
* Suitable for control-oriented applications.
* Limited parallel processing capability.
* Easier to program using C/C++.

#### FPGA

* Implements hardware instead of executing software instructions.
* Multiple operations can execute simultaneously.
* Provides true parallelism.
* Suitable for high-speed and real-time applications.
* Programmed using HDL languages.

---

### 3. Why FPGA?

* Parallel processing capability.
* Reconfigurable hardware.
* High-speed operation.
* Low latency.
* Ability to implement custom digital circuits.
* Better performance for signal processing and image processing applications.

---

### 4. Number Systems

Studied different number systems used in digital electronics.

#### Decimal Number System (Base-10)

* Digits: 0 to 9
* Used in daily calculations.

#### Binary Number System (Base-2)

* Digits: 0 and 1
* Fundamental language of digital systems.

#### Octal Number System (Base-8)

* Digits: 0 to 7
* Compact representation of binary values.

#### Hexadecimal Number System (Base-16)

* Digits: 0 to 9 and A to F
* Widely used in digital design and memory representation.

---

### 5. Necessity of Number Systems

* Digital circuits understand only binary values.
* Long binary numbers are difficult to read and debug.
* Octal and hexadecimal provide compact representation.
* Simplifies hardware design and verification.

---

### 6. Signed and Unsigned Numbers

#### Unsigned Numbers

* Used to represent only positive numbers and zero.
* All bits contribute to magnitude.
* For an n-bit number:

Range:
0 to (2ⁿ - 1)

Example (4-bit):

* 0000 = 0
* 1111 = 15

---

#### Signed Numbers

* Used to represent both positive and negative values.
* One bit is reserved for sign representation.
* Several methods exist for representing signed numbers.

---

### 7. Sign-Magnitude Representation

* MSB (Most Significant Bit) represents sign.

  * 0 → Positive
  * 1 → Negative

Example (4-bit):

* +5 = 0101
* -5 = 1101

#### Limitations

* Two representations for zero:

  * +0 = 0000
  * -0 = 1000
* Arithmetic operations become complicated.
* Additional hardware is required.

---

### 8. One's Complement Representation

Negative number is obtained by inverting all bits of the positive number.

Example:

+5 = 0101

-5 = 1010

#### Limitations

* Two representations for zero:

  * +0 = 0000
  * -0 = 1111
* End-around carry is required during addition.
* Arithmetic circuitry becomes more complex.

---

### 9. Two's Complement Representation

Negative number is obtained by:

1. Taking one's complement.
2. Adding 1.

Example:

+5 = 0101

One's Complement = 1010

Two's Complement = 1011

Therefore:

-5 = 1011

#### Advantages

* Only one representation for zero.
* Simplifies arithmetic operations.
* Same adder circuit can perform both addition and subtraction.
* No end-around carry required.
* Most efficient representation for digital hardware.

#### Reason for Widespread Use

Because of its simpler hardware implementation and unique representation of zero, almost all modern processors, microcontrollers, and FPGAs use Two's Complement representation for signed arithmetic.

---

## Tasks Performed

* Introduction to FPGA architecture.
* Comparison between FPGA and Microcontroller.
* Studied number systems.
* Learned signed and unsigned number representations.
* Understood Sign-Magnitude, One's Complement and Two's Complement methods.

---

## New Terms Encountered

| Term             | Description                             |
| ---------------- | --------------------------------------- |
| FPGA             | Field Programmable Gate Array           |
| LUT              | Look-Up Table                           |
| HDL              | Hardware Description Language           |
| Signed Number    | Represents positive and negative values |
| Unsigned Number  | Represents only positive values         |
| One's Complement | Bitwise inversion representation        |
| Two's Complement | Standard signed number representation   |

---

## Key Takeaways

* FPGA implements hardware functionality through programming.
* FPGA provides parallel processing unlike microcontrollers.
* Different number systems are used for efficient representation of data.
* Signed numbers require special representation methods.
* Two's Complement is preferred because it simplifies arithmetic operations and eliminates multiple representations of zero.
