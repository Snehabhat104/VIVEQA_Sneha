# Day 04 - Sequential Circuits, Flip-Flops and Clock Domain Crossing

## Date

04-06-2026

## Topics Covered

### 1. Sequential Circuits

Unlike combinational circuits, sequential circuits depend on:

* Present inputs
* Previous outputs (state)

They contain memory elements and are capable of storing information.

Examples:

* Elevators
* Traffic Light Controllers
* Counters
* Registers
* Finite State Machines (FSMs)

---

### 2. RS Latch

RS Latch is the simplest memory element.

It evolved from basic logic gates and acts as a 1-bit memory cell.

Inputs:

* S (Set)
* R (Reset)

Outputs:

* Q
* Q'

Capability:

* Retains previous state when inputs are inactive.

### Truth Table (NOR Implementation)

| S | R | Q(next)        |
| - | - | -------------- |
| 0 | 0 | Previous State |
| 0 | 1 | 0              |
| 1 | 0 | 1              |
| 1 | 1 | Invalid        |

---

### 3. RS Latch using NAND Gates

Known as Active-Low RS Latch.

Inputs:

* S'
* R'

### Truth Table

| S' | R' | Q(next)        |
| -- | -- | -------------- |
| 1  | 1  | Previous State |
| 0  | 1  | 1              |
| 1  | 0  | 0              |
| 0  | 0  | Invalid        |

---

### 4. Gated RS Latch

An Enable signal controls whether inputs affect the latch.

Advantages:

* Controlled operation
* Prevents unintended changes

### Truth Table

| EN | S | R | Q(next)        |
| -- | - | - | -------------- |
| 0  | X | X | Previous State |
| 1  | 0 | 0 | Previous State |
| 1  | 0 | 1 | 0              |
| 1  | 1 | 0 | 1              |
| 1  | 1 | 1 | Invalid        |

---

### 5. D Latch

To eliminate the invalid state of RS Latch:

R = D'

A NOT gate is added.

Advantages:

* No invalid condition
* Simpler operation

### Truth Table

| EN | D | Q(next)        |
| -- | - | -------------- |
| 0  | X | Previous State |
| 1  | 0 | 0              |
| 1  | 1 | 1              |

---

### 6. Master-Slave Flip-Flop

Constructed using two latches:

* Master Latch
* Slave Latch

Purpose:

* Eliminates transparency problem.
* Data changes only at clock transition.

---

### 7. D Flip-Flop

Stores one bit of information.

### Truth Table

| Clock Edge | D | Q(next) |
| ---------- | - | ------- |
| ↑          | 0 | 0       |
| ↑          | 1 | 1       |

### Characteristic Equation

Q(next) = D

---

### 8. JK Flip-Flop

Improved version of RS Flip-Flop.

No invalid state exists.

### Truth Table

| J | K | Q(next) |
| - | - | ------- |
| 0 | 0 | Q       |
| 0 | 1 | 0       |
| 1 | 0 | 1       |
| 1 | 1 | Q'      |

### Characteristic Equation

Q(next) = JQ' + K'Q

---

### 9. T Flip-Flop

Obtained from JK Flip-Flop.

J = K = T

### Truth Table

| T | Q(next) |
| - | ------- |
| 0 | Q       |
| 1 | Q'      |

### Characteristic Equation

Q(next) = TQ' + T'Q

Applications:

* Counters
* Frequency Division

---

### 10. Output Delay using Shift Registers

A signal can be delayed by passing it through a chain of flip-flops.

Example:

3-cycle delay:

Input → FF1 → FF2 → FF3 → Output

Applications:

* Synchronization
* Pipelining
* CDC

---

### 11. Routing Delay

Apart from gate delays, signal propagation also experiences routing delays.

Routing Delay:

* Delay introduced by interconnections/wires.
* Often larger than gate delay in modern FPGAs.

Total Delay:

Total Delay = Logic Delay + Routing Delay

---

### 12. Simulation vs Hardware

Simulation may show:

X (Unknown)

Reasons:

* Signal not initialized.
* Multiple drivers.
* Undefined state.

Hardware cannot physically produce X.

Actual hardware resolves to:

* Logic 0
* Logic 1
* Metastable state (temporarily)

X is mainly a simulation concept used to identify design issues.

---

### 13. Wait Statement

Used in testbenches.

Example:

wait(done);

Purpose:

* Pause execution until a condition becomes true.

Important:

Used for simulation only.

Not synthesizable.

---

### 14. Parameterized Coding

Parameters allow reusable hardware designs.

Example:

```verilog
parameter N = 8;
```

Advantages:

* Reusable code
* Scalable designs
* Reduced code duplication

Used extensively in:

* Counters
* Shift Registers
* FIFOs

---

### 15. Clock Domain Crossing (CDC)

Occurs when data moves between different clock domains.

---

### Fast-to-Slow CDC

Problem:

Source clock faster than destination clock.

Risk:

Destination may miss pulses.

---

### Slow-to-Fast CDC

Problem:

Data may be sampled multiple times.

Risk:

Duplicate detection.

---

### Synchronization Techniques

* Two Flip-Flop Synchronizer
* Handshaking
* FIFOs

Used to avoid metastability.

---

### 16. Edge Detection

Using delayed version of signal.

Let:

A = Current Signal

A_delay = Previous Clock Cycle Signal

---

#### Positive Edge Detection

A · A_delay'

Detects:

0 → 1 transition

---

#### Negative Edge Detection

A' · A_delay

Detects:

1 → 0 transition

---

#### Both Edge Detection

A ⊕ A_delay

Detects:

* Rising Edge
* Falling Edge

---

## Assignments

### Task 1

Verify parameterized designs using different parameter values.

Examples:

* N = 4
* N = 8
* N = 16
* N = 100

---

### Task 2

Study and simulate:

* Fast-to-Slow CDC
* Slow-to-Fast CDC

Observe synchronization issues.

---

### Task 3

Implement edge detectors:

* Positive Edge Detector
* Negative Edge Detector
* Both Edge Detector

Using delayed signals.

---

## Additional Exploration

### CATH Test

CATH (Temperature Test)

Used to evaluate device behavior under temperature variations.

Purpose:

* Reliability testing
* Thermal characterization
* Hardware qualification

---

## New Terms Encountered

| Term             | Description                            |
| ---------------- | -------------------------------------- |
| CDC              | Clock Domain Crossing                  |
| Routing Delay    | Delay due to interconnections          |
| Parameterization | Configurable hardware design           |
| Master-Slave     | Two-stage latch structure              |
| Metastability    | Uncertain state during synchronization |
| CATH Test        | Temperature characterization test      |
| Edge Detection   | Detection of signal transitions        |

---

## Key Takeaways

* Sequential circuits store and process state information.
* RS Latch is the fundamental memory element.
* D, JK and T Flip-Flops evolved to overcome limitations of basic latches.
* Routing delay contributes significantly to FPGA timing.
* Testbench constructs such as wait are not synthesizable.
* Parameterized coding improves design reusability.
* CDC issues must be handled carefully to avoid metastability and data loss.
* Edge detection can be implemented using delayed versions of signals.
