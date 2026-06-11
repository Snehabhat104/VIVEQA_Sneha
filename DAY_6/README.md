# Day 6 - Sequential Circuits, Verilog Constructs and FSMs

## Date - 08-06-2026

## Overview

The session focused on sequential circuit design, flip-flop conversions, Verilog behavioral constructs, counters, and the fundamentals of Finite State Machines (FSMs). FSM-based sequence detection using Mealy and Moore machines was also introduced.

---

# 1. Flip-Flop Conversions

Different types of flip-flops can be converted into one another by appropriately driving their inputs.

## Common Flip-Flops

### SR Flip-Flop

* Inputs: S (Set), R (Reset)
* Invalid state when S = R = 1

### JK Flip-Flop

* Inputs: J, K
* No invalid state
* J = K = 1 causes toggling

### D Flip-Flop

* Input: D
* Output follows input on active clock edge

### T Flip-Flop

* Input: T
* Toggles when T = 1

---

## JK Flip-Flop to D Flip-Flop

Desired D Flip-Flop behavior:

| D | Q(next) |
| - | ------- |
| 0 | 0       |
| 1 | 1       |

By comparing JK excitation requirements with D FF behavior, suitable J and K expressions can be derived.

### Importance

* Frequently asked in interviews.
* Demonstrates understanding of excitation tables and state transitions.

---

# 2. Logical NOT vs Bitwise NOT

## Logical NOT (!)

Performs logical inversion.

Example:

```verilog
!1  // 0
!0  // 1
```

Used mainly in conditional statements.

---

## Bitwise NOT (~)

Inverts every bit individually.

Example:

```verilog
~4'b1010
```

Output:

```verilog
0101
```

### Difference

```verilog
!4'b1010  // 0
~4'b1010  // 0101
```

Logical NOT treats the entire value as a single Boolean quantity, whereas Bitwise NOT operates on each bit independently.

---

# 3. Initial Block vs Always Block

## Initial Block

* Executes only once at simulation start.
* Commonly used in testbenches.
* Not generally used for synthesizable hardware logic.

Example:

```verilog
initial begin
    count = 0;
end
```

---

## Always Block

* Executes repeatedly.
* Triggered by sensitivity list events.

Example:

```verilog
always @(posedge clk)
begin
    count <= count + 1;
end
```

### Key Difference

| Initial          | Always              |
| ---------------- | ------------------- |
| Runs once        | Runs repeatedly     |
| Simulation setup | Hardware behavior   |
| Mainly testbench | Synthesizable logic |

---

# 4. Default States of Verilog Data Types

## Reg

Uninitialized reg value:

```verilog
x
```

Meaning:

* Unknown value

Example:

```verilog
reg a;
```

Simulation output:

```verilog
a = x
```

---

## Wire

Undriven wire value:

```verilog
z
```

Meaning:

* High impedance
* Floating connection

Example:

```verilog
wire a;
```

Simulation output:

```verilog
a = z
```

---

# 5. Counters

Counters are sequential circuits that increment or decrement their state on each clock edge.

---

## Up Counter

Sequence:

```text
0000
0001
0010
0011
0100
...
```

Operation:

```verilog
count <= count + 1;
```

---

## Down Counter

Sequence:

```text
1111
1110
1101
1100
...
```

Operation:

```verilog
count <= count - 1;
```

Applications:

* Timers
* Frequency division
* Event counting
* Address generation

---

# 6. Finite State Machines (FSM)

FSMs are sequential systems whose outputs depend on current state and inputs.

Components:

* States
* Inputs
* Outputs
* State transitions

---

# 7. Moore Machine

Output depends only on present state.

```text
Output = f(State)
```

Characteristics:

* More states required
* Output changes only after state transition
* More stable outputs

### Block Representation

```text
Input → State Logic → State Register → Output
```

---

# 8. Mealy Machine

Output depends on current state and input.

```text
Output = f(State, Input)
```

Characteristics:

* Fewer states
* Faster response
* Output can change immediately with input

### Block Representation

```text
Input → State Logic → Output
             |
        State Register
```

---

# 9. Moore vs Mealy

| Moore                          | Mealy                             |
| ------------------------------ | --------------------------------- |
| Output depends only on state   | Output depends on state and input |
| More states                    | Fewer states                      |
| Stable output                  | Faster response                   |
| Output changes on state change | Output can change immediately     |

---

# 10. Sequence Detection

FSMs are widely used for pattern detection in serial data streams.

Examples discussed:

### Mealy Sequence Detector

Detect:

```text
011
```

### Moore Sequence Detector

Detect:

```text
011
```

### Overlapping Mealy Detector

Detect:

```text
1001
```

Overlapping detection allows reuse of previously matched bits.

Example:

```text
Input Stream

1001001
```

Detection occurs more than once because states are reused instead of resetting completely.

---

# Key Takeaways

* Flip-flops can be converted using excitation tables.
* Logical NOT and Bitwise NOT perform different operations.
* Initial blocks execute once, Always blocks execute continuously.
* Uninitialized reg = x, undriven wire = z.
* Up counters increment, down counters decrement.
* FSMs form the basis of many digital designs.
* Moore outputs depend only on state.
* Mealy outputs depend on state and input.
* Sequence detection is a common FSM application.
* Overlapping sequence detectors improve efficiency by reusing matched states.
