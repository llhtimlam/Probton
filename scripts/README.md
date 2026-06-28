## 1. Install WSL
Open **Command Prompt** or **PowerShell** as an Administrator and run (restart after installation):
```
wsl --install
```

## 2. Prepare Environment
Open your **WSL Terminal** and run the following commands to install the compiler, Verilator, and SDL2 graphics libraries:
```
sudo apt update
sudo apt install -y build-essential verilator libsdl2
```

## 3. Setup Tools
Open **Ubuntu (WSL) Terminal** and execute these commands to setup and launch the tools:

### 3.1. Install Docker Desktop on Windows (Need restart computer, <5min>): [Link](https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-win-amd64) & [Guide](https://github.com/sscs-ose/sscs-chipathon-2026/blob/main/docs/install_instructions/Windows/install_docker_desktop.md)

### 3.2. Install Nix-shell (one-time, ~4hr)
It will crash at 74% if only run the command nix-shell
```
env NIX_BUILD_CORES=1 \
    OMP_NUM_THREADS=1 \
    MAKEFLAGS="-j1" \
    nix-shell --max-jobs 1 --cores 1
```

### 3.3. Setup PDK (one-time, 20min)
```
make clone-pdk
```

### 3.4. Launch IIC-OSIC-TOOLS docker
Launch Docker Desktop 

### 3.5. Docker Desktop Setting(one-time)

Setting (Top panel) > Resources (Under General on left) > WSL integration (Scroll up and click the top 5th panel to right)

> Configure which WSL 2 distros you want to access Docker from.
>
> (Tick) Enable integration with my default WSL distro
>
> Enable integration with additional distros:
>
> (Turn it on) Ubuntu

Click Apply & Restart (Bottom right)

### 3.6. Install and Start docker environment(one-time wait, 1hr) (Fast after installation)
Return to **Ubuntu (WSL) Terminal** and run (terminal won't show up if only run the command ./scripts/run_docker_iic.sh)
```
DISPLAY=:0 EXTRA_VOLS="-v /mnt/wslg/.X11-unix:/tmp/.X11-unix:rw -v /mnt/wslg:/mnt/wslg" ./scripts/run_docker_iic.sh
```

## Launch Tools
In the **Docker Desktop Terminal**, run
Check Available Tools
```
ls -l /foss/tools/
```

```
xschem
```

```
klayout
```

```
magic
```

## Compile and Harden completed analog and digital circuit design
```
SLOT=workshop make librelane
```