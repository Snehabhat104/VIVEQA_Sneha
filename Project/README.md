# FPGA-Based Ultrasonic Radar System using Artix-7 FPGA

## Project Overview

This project implements a real-time **Ultrasonic Radar System** using the **AT-STLN Artix-7 FPGA Development Board**. The radar uses an **HC-SR04 ultrasonic sensor** mounted on an **SG90 servo motor** to scan the surroundings over a **180°** range.

The FPGA controls the servo motor, triggers the ultrasonic sensor, measures the distance to nearby objects, and sends the angle and distance information to a computer through **UART communication**. A **Processing 4** application receives this data and displays it as a live radar screen.

This project demonstrates how an FPGA can be used for real-time sensing, motor control, serial communication, and graphical visualization using Verilog HDL.

---

# Objectives

- Design an FPGA-based ultrasonic radar system.
- Control an SG90 servo motor using PWM.
- Measure object distance using the HC-SR04 ultrasonic sensor.
- Transmit angle and distance through UART.
- Display the radar output using Processing 4.
- Detect objects within a predefined range.

---

# Hardware Components

- AT-STLN Artix-7 FPGA Development Board
- HC-SR04 Ultrasonic Sensor
- SG90 Servo Motor
- FTDI USB-to-UART Module
- External 5V Power Supply
- Jumper Wires

---

# Software Used

- Xilinx Vivado Design Suite
- Verilog HDL
- Processing 4
- PuTTY

---

# Working Principle

1. The FPGA generates a PWM signal to rotate the SG90 servo motor from **0° to 180°**.
2. The ultrasonic sensor rotates along with the servo and continuously scans the surroundings.
3. At each angle, the FPGA sends a trigger pulse to the HC-SR04 sensor.
4. The sensor measures the distance to the nearest object using the echo pulse.
5. The FPGA calculates the distance from the echo pulse width.
6. The angle and distance are transmitted to the computer through UART.
7. The Processing 4 application reads the serial data and updates the radar display in real time.
8. Detected objects are displayed as **red dots**, while the radar sweep is shown in **green**.

---

# Project Structure

```
FPGA-Ultrasonic-Radar
│
├── top.v
├── servo_controller.v
├── ultrasonic_sensor.v
├── radar_controller.v
├── radar_uart.v
├── uart_tx.v
├── constraints.xdc
├── Processing_Radar.pde
└── README.md
```

---

# Verilog Modules

### top.v
The top-level module that connects all the individual modules together.

### servo_controller.v
Generates PWM signals for the SG90 servo motor and continuously sweeps it between 0° and 180°.

### ultrasonic_sensor.v
Generates trigger pulses, measures the echo pulse width, and calculates the object distance.

### radar_controller.v
Transfers the measured angle and distance values to the UART module.

### radar_uart.v
Converts the angle and distance values into ASCII format before sending them through UART.

### uart_tx.v
Implements the UART transmitter operating at **115200 baud**.

---

# UART Data Format

The FPGA sends data in the following format:

```
AAA,DDD
```

Example:

```
090,015
091,016
092,018
```

Where:

- **AAA** = Servo Angle (0°–180°)
- **DDD** = Distance in centimeters

---

# Radar Visualization

The Processing 4 application displays:

- Green radar grid
- Green rotating sweep line
- Current angle and distance
- Red dots for detected objects
- Live radar visualization

---

# Features

- 180° automatic scanning
- Real-time object detection
- UART communication
- FPGA-based hardware implementation
- Modular Verilog design
- Processing 4 graphical interface
- LED indication based on measured distance

---

# Results

The project successfully demonstrates:

- Smooth servo scanning from **0° to 180°**
- Accurate distance measurement using the HC-SR04 sensor
- Stable UART communication between the FPGA and the computer
- Real-time radar visualization in Processing 4
- Detection of nearby objects within the configured range

---

# Applications

- Obstacle detection
- Robotics
- Industrial automation
- Smart navigation systems
- Educational FPGA projects
- Embedded system learning

---

# Future Improvements

- 360° scanning using a continuous rotation servo
- Wireless communication (Bluetooth or Wi-Fi)
- OLED/TFT display
- Multiple ultrasonic sensors
- Object tracking
- Data logging

---

# Conclusion

This project successfully implements an FPGA-based ultrasonic radar system capable of detecting nearby objects and displaying their position in real time. The Artix-7 FPGA controls the servo motor, interfaces with the ultrasonic sensor, calculates the object distance, and communicates with a computer through UART. The Processing 4 application provides an easy-to-understand radar interface, making the system suitable for educational purposes and demonstrating practical FPGA-based embedded system design.

---
