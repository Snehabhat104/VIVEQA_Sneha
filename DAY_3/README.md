# Day 03 - Encoders, Decoders, Multiplexers and Verilog Concepts

## Date

03-06-2026

## Topics Covered

### 1. Encoders

An Encoder converts human-readable information into machine-readable binary format.

For an Encoder:

* Number of Inputs = 2ⁿ
* Number of Outputs = n

Example:

8-to-3 Encoder

* 8 Inputs
* 3 Outputs

Only one input should be HIGH at a time.

---

### Problem with Basic Encoders

What happens if:

* No input is HIGH?
* More than one input is HIGH?

The output becomes ambiguous.

---

### Priority Encoder

A Priority Encoder assigns priority to inputs.

If multiple inputs become HIGH simultaneously:

* Highest priority input is encoded.
* Remaining inputs are ignored.

Example:

If D7 and D3 are HIGH,

Output corresponds to D7.

---

### Priority Encoder - if-else

In Verilog:

```verilog
if(d7)
else if(d6)
else if(d5)
...
```

creates a Priority Encoder in hardware.

Reason:

Conditions are checked sequentially.

Higher conditions receive priority.

---

### Encoder-Decoder Communication

Instead of transmitting 8 separate lines:

* Encode information using 3 bits.
* Transmit only 3 lines.
* Decode at receiver side.

Advantage:

* Reduced wiring complexity.
* Reduced transmission cost.

---

### 2. Decoders

A Decoder converts machine-readable binary information into human-readable outputs.

For a Decoder:

* Inputs = n
* Outputs = 2ⁿ

Example:

3-to-8 Decoder

* 3 Inputs
* 8 Outputs

Only one output becomes active at a time.

---

### Decoder and Minterms

Active High Decoder:

* Selected output becomes HIGH.
* Outputs directly represent Minterms.

Example:

Y3 = A'BC

---

### Decoder and Maxterms

Active Low Decoder:

* Selected output becomes LOW.
* Outputs represent Maxterms.

This property is widely used in Boolean function realization.

---

### Seven Segment Display

Used to display decimal digits.

Contains:

* Seven LEDs
* Named a, b, c, d, e, f, g

Used in:

* Digital clocks
* Calculators
* Measurement instruments

---

### BCD to Seven Segment Decoder

Input:

* 4-bit BCD

Output:

* Seven Segment Signals

Function:

Converts decimal digit into corresponding segment pattern.

---

### 3. Multiplexers (MUX) - case statements

A Multiplexer selects one input among multiple inputs.

For a MUX:

* Inputs = 2ⁿ
* Select Lines = n
* Output = 1

Example:

4:1 MUX

* Inputs = 4
* Select Lines = 2
* Output = 1

---

### Why MUX is Important?

MUX is called a Universal Logic Block.

Reason:

Any Boolean function can be implemented using MUXes.

---

### Case Statement and MUX

In Verilog:

```verilog
case(sel)
```

typically synthesizes into a Multiplexer.

Hardware generated depends on select lines.

---

### 4. Timing Diagrams

Timing diagrams represent:

* Signal values
* Transitions
* Timing relationships

Used extensively for:

* Verification
* Debugging
* Functional analysis

---

### Important Question Discussed

Question involved:

* 54-bit value
* Multiplied by a number requiring 8 bits (179)

Observation:

179 requires 8 bits for representation.

General Rule:

If

* Operand 1 = m bits
* Operand 2 = n bits

Maximum product width:

m + n bits

Therefore:

54-bit × 8-bit

Output Width = 62 bits

---

### 5. Verilog Concepts

#### Reg vs Wire

Wire:

* Represents physical connections.
* Continuously driven.
* Output changes instantly with input.

Reg:

* Holds assigned value.
* Required inside always blocks.

Rule:

Outputs assigned inside always blocks must be declared as reg.

---

### Sensitivity List

Hardware is synthesized based on the sensitivity list.

Example:

```verilog
always @(a,b,c)
```

describes combinational logic.

Example:

```verilog
always @(posedge clk)
```

describes sequential logic.

Hardware is synthesized from the description, not executed like software.

---

### Testbench is Not Synthesizable

Testbenches are used only for simulation.

Examples:

* #10 delays
* Clock generation blocks
* $display
* $monitor

cannot be synthesized into hardware.

---

### Clock Generation in Testbench

Example:

```verilog
always
    #5 clk = ~clk;
```

Used only for simulation.

Real hardware clocks are generated using:

* Crystal Oscillators
* PLLs

---

### Procedural Blocks

Initial Block:

* Executes once.
* Simulation only.

Always Block:

* Executes repeatedly.
* Used for hardware description.

---

### Functions

* Used only for combinational logic.
* Cannot contain timing delays.
* Help reduce repetitive code.

---

### For Loop and Generate

Generate blocks use for-loops to create repeated hardware structures.

Example:

* Ripple Carry Adders
* Arrays of Registers
* Repetitive Logic

---

### Resets

#### Synchronous Reset

Reset checked only at clock edge.

#### Asynchronous Reset

Reset acts immediately independent of clock.

---

### Delay Implementation using Shift Registers

A signal can be delayed by storing previous values in registers.

Example:

* 3 Flip-Flops → 3-cycle delay
* 100 Flip-Flops → 100-cycle delay

Commonly implemented using Shift Registers.

---

## Tasks Assigned

### Task 1

Implement Full Adder using:

1. Active High Decoder
2. Active Low Decoder

Objective:

* Realize combinational logic using decoders.

---

### Task 2

Implement basic logic gates using Multiplexers.

Examples:

* AND
* OR
* NAND
* NOR
* XOR
* XNOR

Objective:

Understand MUX as a Universal Logic Block.

---

### Task 3

Implement D Flip-Flop using Multiplexers.

Objective:

Understand sequential circuit realization using combinational blocks.

---

### Task 4

Implement Full Adder using Structural Modeling.

Requirement:

* Instantiate two Half Adders.
* Construct one Full Adder.

---

### Task 5

Implement output delay of 3 clock cycles using Shift Registers.

---

### Task 6

Implement output delay of 100 clock cycles.

---

### Additional Exploration

Study Arduino Architecture:

* Microcontroller Core
* Memory Organization
* GPIO
* Timers
* Communication Interfaces

---

## New Terms Encountered

| Terms                  | Description                               |
| --------------------- | ----------------------------------------- |
| PLL                   | Phase Locked Loop                         |
| EDA                   | Electronic Design Automation              |
| Inout Port            | Bidirectional Port                        |
| Structural Modeling   | Circuit built using module instantiations |

---

## Key Takeaways

* Encoders reduce transmission lines by converting information into binary form.
* Priority Encoders resolve multiple active input conditions.
* Active High Decoders generate minterms, while Active Low Decoders generate maxterms.
* Multiplexers can implement any Boolean function and are considered universal logic blocks.
* Testbenches are used only for simulation and are not synthesizable.
* Hardware synthesis depends on sensitivity lists and HDL descriptions.
* Shift registers provide an efficient method for implementing clock-cycle delays.
