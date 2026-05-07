# ⏰ Digital Clock Design in Verilog

## 📌 Overview
This project implements a **24-hour digital clock** using Verilog HDL.  
It generates seconds, minutes, and hours using a clock divider and sequential logic.

The design is verified through simulation and waveform analysis.

---

## ⚙️ Specifications

- **Language**: Verilog HDL  
- **Clock Input**: System clock (`clk`)  
- **Reset**: Active LOW asynchronous reset (`rst`)  

### Outputs:
- `sec` → 0 to 59  
- `min` → 0 to 59  
- `hr`  → 0 to 23  

---

## 🧠 Design Description

### 🔹 Clock Divider
A counter is used to divide the input clock into a slower clock signal (`clk_1`), which drives the time logic.

- In simulation: a small counter value is used for faster results  
- In hardware: this can be adjusted to generate a 1 Hz clock  

---

### 🔹 Time Counter Logic

- Seconds increment from **0 → 59**
- Minutes increment when seconds reach **59**
- Hours increment when minutes reach **59**
- Hours reset after **23** (24-hour format)

---

## ▶️ Simulation Details

- Clock period: **10 time units**
- Reset applied initially and released after **20 time units**
- Simulation runtime: **5000 time units**

### Waveform Dump
```verilog
$dumpfile("digital.vcd");
$dumpvars(0, digital_tb);
