## 1. Install WSL (Optional)
Open **Command Prompt** or **PowerShell** as an Administrator and run (restart after installation):
```
wsl --install
```

## 2. Prepare Environment (Optional)
Open your **WSL Terminal** and run the following commands to install the compiler, Verilator, and SDL2 graphics libraries:
```
sudo apt update
sudo apt install -y build-essential verilator libsdl2
```

## 3. Setup Simulation Tools
 
<details>
<summary><b>Window Path</b></summary>

Open **Terminal (Powershell)** and execute these commands to setup and launch the tools:

# 1. Install the Icarus Verilog and GTKWave
```
winget install -e --id BleYer.IcarusVerilog
```

# 2. Install cocotb for Python
```
pip install cocotb
```

</details>

<details>
<summary><b>Linux Path</b></summary>

Open **Ubuntu (WSL) Terminal** and execute these commands to setup and launch the tools:

# 1. Install the Icarus Verilog and GTKWave
```
sudo apt update && sudo apt install -y iverilog gtkwave
```

# 2. Install cocotb for Python
```
pip3 install cocotb cocotb-tools --break-system-packages
```

</details>

## Launch Simulation Tools

## Option 1: gtkwave.exe

Navigate to C:\iverilog\gtkwave\bin

Launch gtkwave.exe

File > Open New Tab and Select your .fst or .gtkwave file for view


## Option 2: direct access (One-time Setup)


Navigate to cocotb\sim_build folder

Open .gtkw file and enter "Selecting an app to open this .gtkw file" Interface

Scroll to bottom to click "Choose from an app on your PC"

C:\iverilog\gtkwave\bin and select "gtkwave.exe"


```
Launch .gtkw file directly
```

## Option 3: Terminal

Open **Terminal (Powershell)** and execute these commands to launch the gtkwave:
```
& C:\iverilog\gtkwave\bin\gtkwave.exe sim_build\state_machine.gtkw
```