# FPGA-Based Ultrasonic Radar System

## Overview

This project is a simple FPGA-based ultrasonic radar system developed using the **AT-STLN Artix-7 FPGA Development Board**. The system uses an **HC-SR04 ultrasonic sensor** mounted on an **SG90 servo motor** to scan the surroundings from **0° to 180°**.

As the servo rotates, the ultrasonic sensor measures the distance to nearby objects. The FPGA processes this information and sends the **angle** and **distance** values to a computer through **UART communication**. A **Processing 4** application receives the data and displays it as a real-time radar screen.

## Features

- 180° automatic scanning
- Real-time object detection
- Distance measurement using HC-SR04
- Servo motor control using PWM
- UART communication between FPGA and PC
- Live radar visualization using Processing 4

## Hardware Used

- AT-STLN Artix-7 FPGA Development Board
- HC-SR04 Ultrasonic Sensor
- SG90 Servo Motor
- FTDI USB-to-UART Module
- External 5V Power Supply

## Software Used

- Xilinx Vivado
- Verilog HDL
- Processing 4
- PuTTY

## How It Works

1. The FPGA rotates the servo motor from **0° to 180°**.
2. The ultrasonic sensor measures the distance to any object in front of it.
3. The FPGA calculates the distance and sends the angle and distance through UART.
4. The Processing application reads the data and displays a radar-like interface.
5. Detected objects are shown on the radar in real time.

## Project Files

```
top.v
servo_controller.v
ultrasonic_sensor.v
radar_controller.v
radar_uart.v
uart_tx.v
constraints.xdc
Processing Radar Code
```

## Output

- Smooth 180° radar scanning
- Live angle and distance display
- Real-time radar visualization
- Object detection on the radar screen

## Future Improvements

- 360° scanning
- Wireless communication
- Multiple sensor support
- Better graphical interface

