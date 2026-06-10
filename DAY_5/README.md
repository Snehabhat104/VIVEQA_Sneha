# Day 05 - Flip-Flop Conversions, Registers, Counters and FPGA Architecture

## Date

05-06-2026

## Topics Covered

### 1. Conversion Between Flip-Flops

Studied methods for converting one type of flip-flop into another.

Examples:

* SR to JK
* JK to D
* D to T
* T to JK

Purpose:

* Achieve desired functionality without changing hardware.
* Commonly used in digital system design.

---

### 2. Registers

A Register is a collection of flip-flops used for storing binary information.

Applications:

* Data Storage
* Data Transfer
* Data Delay
* Data Shifting

An n-bit register requires n flip-flops.

---

### 3. Shift Registers

Shift registers move data from one flip-flop to another on each clock pulse.

---

#### Serial-In Serial-Out (SISO)

* Data enters serially.
* Data exits serially.

Applications:

* Delay Circuits
* Data Synchronization
* Clock Cycle Delays

---

#### Serial-In Parallel-Out (SIPO)

* Data enters serially.
* Multiple bits become available simultaneously.

Applications:

* Serial Communication Receivers
* Data Conversion

---

#### Parallel-In Serial-Out (PISO)

* Data loaded simultaneously.
* Data transmitted serially.

Applications:

* Serial Communication Transmitters
* Data Compression for Transmission

---

#### Parallel-In Parallel-Out (PIPO)

* Parallel loading
* Parallel output

Applications:

* Temporary Data Storage
* High-Speed Data Transfer

---

### 4. Shift Operations in Hardware

Example:

```verilog
a << 2
a >> 2
```

These operations are combinational.

No flip-flops are required.

Hardware implementation:

* Only rewiring of bits.
* Synthesized as interconnections.

Example:

```text
a = 1011

a << 1 = 0110
```

Bits are simply repositioned.

---

### 5. Arithmetic using Shifts

Multiplication by powers of 2:

```text
A × 2 = A << 1
A × 4 = A << 2
A × 8 = A << 3
```

Division by powers of 2:

```text
A ÷ 2 = A >> 1
A ÷ 4 = A >> 2
A ÷ 8 = A >> 3
```

Advantage:

* No multiplier hardware required.
* No divider hardware required.
* Faster implementation.

---

### 6. Random Number Generation

#### $random

Verilog system task used during simulation.

Example:

```verilog
data = $random;
```

Used for:

* Testbench stimulus generation
* Verification

Not synthesizable.

---

### 7. Linear Feedback Shift Register (LFSR)

Used for pseudo-random number generation.

Components:

* Shift Register
* XOR Feedback Logic

Features:

* Hardware efficient
* Deterministic sequence
* Appears random

Applications:

* Cryptography
* Testing
* Data Scrambling
* Error Detection

---

### 8. Counters

Counter:

A sequential circuit that counts clock pulses.

Applications:

* Frequency Division
* Event Counting
* Timing Circuits
* Address Generation

---

### 9. Toggling

Toggling means changing state:

```text
0 → 1
1 → 0
```

T Flip-Flops toggle on every active clock edge when T = 1.

---

### 10. Blocking and Non-Blocking Assignments

#### Blocking Assignment

```verilog
=
```

Characteristics:

* Executes sequentially.
* One statement waits for previous statement.

Used mainly in:

* Combinational Logic

Example:

```verilog
a = b;
c = a;
```

---

#### Non-Blocking Assignment

```verilog
<=
```

Characteristics:

* All assignments occur simultaneously.
* Models actual hardware behavior.

Used mainly in:

* Sequential Logic
* Flip-Flops
* Registers

Example:

```verilog
a <= b;
c <= a;
```

---

### 11. Delta Delays in Simulation

Simulator introduces very small scheduling delays known as Delta Delays.

Example:

```verilog
initial begin
    i <= #5 1'b0;
    i <= #5 1'b1;
end
```

Both assignments occur at same simulation time.

Result:

Latest assignment wins.

Final Value:

```text
i = 1
```

---

### 12. Elaboration

Elaboration is the stage before simulation begins.

Activities:

* Parameter evaluation
* Module instantiation
* Hierarchy creation
* Connectivity checks

Result:

Design hierarchy is generated.

---

### 13. Netlist

A netlist represents the synthesized hardware.

Contains:

* Gates
* Flip-Flops
* Interconnections

An empty netlist generally indicates:

* Logic optimized away
* No useful hardware generated

---

### 14. GPIO and Debouncing

GPIO:

General Purpose Input Output

Problem:

Mechanical switches produce multiple transitions due to bouncing.

Solution:

* Debouncing Circuit
* Delay-Based Filtering
* Synchronization Logic

Applications:

* Push Buttons
* Keypads

---

### 15. FPGA Clock Resources

#### Global Buffers

Used for clock distribution.

Advantages:

* Low skew
* High fanout capability

---

#### IBUF

Input Buffer

Function:

External Signal → FPGA Internal Logic

---

#### OBUF

Output Buffer

Function:

FPGA Internal Logic → External Pin

---

### 16. Reset Selection

#### Synchronous Reset

Advantages:

* Less sensitive to glitches.
* Preferred when reset signal may contain noise.

---

#### Asynchronous Reset

Advantages:

* Immediate reset action.
* Does not wait for clock edge.

Disadvantage:

* Susceptible to glitches.

---

### 17. Functions and Tasks

#### Functions

Characteristics:

* Return one value.
* Combinational only.
* Cannot contain timing delays.
* Cannot call tasks.

---

#### Tasks

Characteristics:

* May return multiple values.
* Can contain delays.
* Can include timing controls.
* Useful in testbenches.

Common Uses:

* Stimulus Generation
* Reusable Verification Procedures
* Testbench Automation

---

### 18. Finite State Machines (FSM)

FSMs store state information and make decisions based on:

* Current State
* Inputs

Applications:

* Sequence Detectors
* Traffic Controllers
* Communication Protocols

---

### Sequence Detector

Used to detect a predefined bit pattern.

Example:

1011

Without FSM:

* Previous history is not stored.
* Overlapping or repeating sequences may be missed.

With FSM:

* Previous states are remembered.
* Repeated and overlapping sequences can be detected correctly.

---

### 19. Latch Implementation

Discussed latch realization using:

* Two NOT gates
* One AND gate

Used to illustrate feedback and state retention concepts.

---

## Assignments

### Task 1

Test parameterized modules using multiple parameter values.

Examples:

* N = 4
* N = 8
* N = 16
* N = 32

---

### Task 2

Study shift-register-based pseudo-random number generation using LFSRs.

---

### Task 3

Analyze Fast-to-Slow and Slow-to-Fast Clock Domain Crossing behavior.

---

### Task 4

Explore FSM-based sequence detectors and compare with non-FSM implementations.

---

### Additional Exploration

#### Artix-7 XC7A35T FPGA Architecture

Study:

* CLBs (Configurable Logic Blocks)
* LUTs
* Flip-Flops
* DSP Slices
* BRAM
* Clocking Resources
* I/O Blocks

---

#### Hydroponics

Hydroponics is a method of growing plants without soil.

Features:

* Nutrient-rich water solution
* Controlled environment
* Efficient water usage

Mentioned during discussion regarding industrial and agricultural automation applications.

---

## New Terms Encountered

| Term          | Description                            |
| ------------- | -------------------------------------- |
| LFSR          | Linear Feedback Shift Register         |
| GPIO          | General Purpose Input Output           |
| IBUF          | Input Buffer                           |
| OBUF          | Output Buffer                          |
| Global Buffer | Dedicated FPGA clock routing resource  |
| FSM           | Finite State Machine                   |
| Elaboration   | Pre-simulation design processing stage |
| Netlist       | Hardware connectivity description      |
| Hydroponics   | Soil-less plant cultivation technique  |

---

## Key Takeaways

* Registers are collections of flip-flops used for storage and shifting.
* Shift operations are implemented through wiring rather than arithmetic hardware.
* LFSRs provide efficient pseudo-random number generation.
* Non-blocking assignments model real hardware behavior.
* Functions are synthesizable combinational constructs, while tasks are heavily used in simulation.
* FSMs are essential for sequence detection and state-dependent operations.
* FPGA clocking resources ensure reliable clock distribution across the device.
