# **Probton** - ASIC Solution for Optical Probe Station for Photonic Integrated Circuits Packaging and Testing
### [2026 Chipathon SSCS PICO](https://sscs.ieee.org/technical-committees/tc-ose/sscs-pico-design-contest/) - Track B (Circuit for Sensors) - Team B18 Probton

## Project Description
Our goal is to develop an open-source ASIC for auto aligner. In our demonstration we are targeting optical probe stations where it reads photodetector signals, extracts vibration-synchronous alignment error from dither motion, estimates the peak offset, and drives a high speed and accuracy real-time alignment correction.

### Scoll down for more details!

<img src="Media\Setup\Optical Probe Station Real Setup.png" width="100%" alt="Optical Probe Station Setup">

## Problem Statement
Photonic packaging and integration are becoming increasingly important as Co-Packaging Optics (CPO) grows, but scalable alignment and testing remain difficult. Current alignment approaches are often specialized and not yet built for high-volume throughput [1].

High-volume CPO production may require hundreds of active alignments per module, scaling to millions of modules per month in large fabs. Existing setups typically rely on expensive, discrete desktop instrument boxes with proprietary hardware controllers and separate optical power meters.

There is a clear need for a low-cost hardware solution that performs alignment-error processing close to the sensor—enabling nanometer-precision alignment under real-time environmental disturbance, mechanical drift, and tight timing constraints.

## Value Preposition
Our ASIC provides an open-source, edge-processed feedback control loop for optical probe stations. By moving error demodulation and computation from external software into localized hardware, we eliminate data-bus latency and substantially improve alignment speed.

This offers a low-cost, integrable alternative to proprietary alignment hardware [3, 4].

<img src="Media\Setup\Optical Probe Station Validation Setup.png" width="100%" alt="Optical Probe Station Setup">

## Progress Tracker

[Progress Summary](https://docs.google.com/spreadsheets/d/1hN5MHLxyh5gYtU_8X9257t1sGRkRGrkGu-Tv-lXbI_Q/edit?gid=0#gid=0)

[Notion](https://app.notion.com/p/abraaralam/Probton-Home-377a16d0b43280fa8b21c942e25e7d73)

## Chip Architect

Size: 1110um x 1110um - Block type A

Required pins: 19

Digital pin: (19)

Input: (5)

1. SPI: nCS
2. SPI: sclk
3. SPI: mosi
4. External analog domain: comp_x
5. External analog domain: comp_y

Output: (10)

1. SPI: miso
2. Motion command: move_en_x (x)
3. Motion command: dir_x (x)
4. Motion command: move_en_y (y)
5. Motion command: dir_y (y)
6. MEMS driver (PWM waveform): mems_drv_x (x)
7. MEMS driver (PWM waveform): mems_drv_y (y)
8. Reference wave output (PWM waveform): ref_wave_x (x)
9. Reference wave output (PWM waveform): ref_wave_y (y)
10. External analog domain: read_en

Setup pin: (4)
1. clk
2. rst_n
3. Power Pin: VDD (3.3V)
3. Power Pin: Common Ground

<img src="Media\ChipArchitect\Optical Probe Station Chip Architect.png" width="100%" alt="Proposed Chip Architect">

```
📁 Project Root
├── 📁 Media/                           # Presentation & graphics for this project
│   └── 📁 Presentation                 # Chipathon presentation for each checkpoint (Proposal → Schematic → Simulation → Layout* → Final Submission)
│   └── 📁 ChipArchitect                # Chip architecture diagram
│   └── 📁 Setup                        # Hardware setup diagram for optical probe station and verification of this project
│   └── 📁 Simulation                   # Python simulation diagram for the concept idea and proposed algorithm (not implemented in ASIC)
│   └── 📁 Schematic                    # Schematic diagram for analog domain
│   └── 📁 Layout                       # Layout graphics for entire mixed signal system 
├── 📁 src/                             # Digital circuit design source files (SystemVerilog)
│   └── 📄 slot_defines.svh             # Chipathon template for slot setting
│   └── 📄 chip_top.sv                  # Chipathon template for top level
│   └── 📄 chip_core.sv                 # Chipathon template for core level, compiled with digital domain (not used for layout generation flow)
│   └── 📄 analog_macro.sv              # Analog Domaain wrapper (not used for layout generation)
|   # Layout Review
│   └── 📄 wrapper.sv                   # chip_core.sv replacement wrapper for the layout generation
│   └── 📄 analog_block.sv              # 480μm x 240μm Analog Domaain wrapper blackbox
│   └── 📄 digital_domain.sv            # 1117.5μm x 558.75μm Digital Domaain wrapper (carved out 480μm x 240μm analog domain)
│   └── 📄 state_machine.sv             # Finite State Machine controller
│   └── 📄 spi.sv                       # SPI controller
│   └── 📄 wave_controller.sv           # Handle timing, calibration, timing for readout, MEMS signal generation in ΔΣ Modulated Digital Waveform
│   └── 📄 signal_processor.sv          # Parsing dithering signal and report movement and report back to user
│   └── 📄 sine_lut.sv                  # Helper for generating ΔΣ Modulated Digital Waveform in sine wave for MEMS & referecne wave to wave mixer analog module
├── 📁 cocotb/                          # Digital SystemVerilog cocotb simulation results & verification
│   └── 📄 README.md                    # Instructions for setting up cocotb & GTKWave simulation environment
│   └── 📁 sim_build                    # GTKWave waveform simulation result
├── 📁 Analog/                          # (Not implemented for tapeout)
│   └── 📁 schematics/                  # Analog circuit design files
│       └── 📄 B18_Probton.sch          # Integrated Schematic for whole system
|       # Analog submodule folder
│       └── 📁 1_readout                # Analog Front End (Switch → TIA → BFP)
│           └── 📁 tia                  # Transimpedance Amplifier
│               └── 📁 second stage     # (Not implemented)
│           └── 📁 bpf                  # Band pass Filter
│       └── 📁 2_mixer                  # Wave Mixer (Gilbert cell → 1st 5T OTA → Low Pass Filter)
│       └── 📁 3_comparator             # Comparator (StrongArm Comparator → Inverter x2 → RS Latch → 2x Inverter)
|       # Analog submodule schematic and layout file (inside submodule folder)
|       # 📄 /**/*_tb.sch               # Testbench schematic
|       # 📄 /**/*.sym                  # Symbol for schematic
│       # 📁 /**/*/simulation_files     # Schematic Simmulation Raw file
│       # 📁 /**/*/layout               # Analog layout files
├── 📁 def/
│   └── 📁 A                            # Chipathon provided def template
├── 📁 librelane/
│   └── 📁 slots                        # Chipathon template for slots setting
│   └── 📄 chip_top.sdc                 # Chipathon template
│   └── 📄 pdn_cfg.tcl                  # Chipathon template
|   # Digital Domain Layout Generation
│   └── 📄 config.yaml                  # Layout generation setting
│   └── 📄 pin_order.cfg                # Pin placement for Odb.CustomIOPlacement IO_PIN_ORDER_CFG
│   └── 📄 analog_block.*               # Macro for analog blackbox (not used)
│   └── 📁 Digital_Domain               # Digital domain layout report
│   └── 📁 Digital_Domain_Padframe      # Digital domain integrated with padframe layout report
|   # Digital Domain submodule (not used)
│   └── 📁 Config                       # .yaml setting and Odb.CustomIOPlacement IO_PIN_ORDER_CFG .cfg setting for all module
│   └── 📁 Submodule                    # Digital domain submodule layout report
└── 📁 gds/
│   └── 📄 B18_Probton.gds              # DRC dry run gds file for layout review*
│   └── 📄 B18_Probton.lyrdb            # DRC check report for B18_Probton.gds
│   └── 📁 analog_domain                # (Not used)
│   └── 📁 digital_domain               # (Not used)
├── 📁 scripts/
│   └── 📄 README.md                    # Instructions for setting up IIC-OSIC-TOOLS docker used for this project
│   └── 📁 python                       # Librelane plugin forked from 9T DCIM SRAM Macro — Chipathon 2026 (Team A07 Blueprints)
│       └── 📁 librelane_plugin_padframe_bridge
│           └── 📄 __init__.py
│           └── 📄 odbpy_script.py      # Script for flow: ClassicWithPadframeBridge
```

## Schematic Review

<img src="Media\Schematic\analog_schematic.png" width="100%" alt="Analog Schematic">

Video for Schematic Review: [Youtube](https://youtu.be/nWU8KJn_Hf8)

Presentation Deck for Schematic/Simulation Review : [Google Slides](https://docs.google.com/presentation/d/1yArg9eURDTD4U1TzQWk_HXc--uBOyANuxjhyyxrrQCk/edit?slide=id.g3f54761703b_0_330#slide=id.g3f54761703b_0_330)

<video src="https://youtu.be/nWU8KJn_Hf8" controls="controls" width="100%">
</video>

## Layout Review

<img src="Media\Layout\B18_Probton_integration.png" width="100%" alt="Layout">

Video for Layout Review: [Youtube](https://youtu.be/rO0A9EQpW5c)

Presentation Deck for Layout Review : [Google Slides](https://docs.google.com/presentation/d/1-wRJ25tOpLcIwcqMKb84TJG7cVurhM7Yr_dMmYaoczU/edit?slide=id.g3f0ce36bc21_4_376#slide=id.g3f0ce36bc21_4_376)

Antenna Clean

DRC Clean except Density Rule for M1 - MTop

LVS Clean


## Simulation result for core concept

Alignment Sensitivity = ±10.95 μm @ -3dB

Alignment Precision = 2.665 ± 3.010 µm (Total Step movement 457.7 ± 326.3)

Motor movement = 0.375 µm @ Step (25 nm/V @ 15V)

MEMS Span = ±5 µm @ 300/400Hz

> Simulation result could be further improved with error processing feature, not implemented in the simulation.

<img src="Media\Simulation\Optical Probe Station Monte Carlo Simulation 2D.png" width="100%" alt="Monte Carlo Simulation 2D">

<details>
<summary><b>Original Simulation (Superceded by simplified version due to Chipathon timeline)</b></summary>

Alignment Sensitivity = ±10.95 μm @ -3dB

Alignment Precision = 0.755 ± 0.633 µm (Total Step movement 44.4 ± 17.7)

Motor movement = 0.294 µm ~ 1.875 µm @ Step (25 nm/V)

MEMS Span = ±5 µm @ 300/400Hz


<img src="Media\Simulation\Optical Probe Station Simulation 1D.png" width="100%" alt="Simulation Result">

<video src="Media\Simulation\Optical Probe Station Simulation 2D.mp4" controls="controls" width="100%">
</video>

<video src="https://github.com/user-attachments/assets/78566907-bb74-424e-98aa-8ca5e5057ff0" controls="controls" width="100%">
</video>

<img src="Media\Simulation\VersionProposal\Optical Probe Station Monte Carlo Simulation 2D.png" width="100%" alt="Monte Carlo Simulation 2D">

</details>

## Links


[Progress tracker](https://docs.google.com/spreadsheets/d/1hN5MHLxyh5gYtU_8X9257t1sGRkRGrkGu-Tv-lXbI_Q/edit?usp=sharing) (Not Updated)


[Proposal Slide Link](https://docs.google.com/presentation/d/1q4hdv7IWDyOom2BOauEokjyfa9oZNoGCGBChGqaYRIs/edit?slide=id.g3ed01995daf_2_93#slide=id.g3ed01995daf_2_93)

[Proposal Video Link](https://drive.google.com/file/d/186RtQrj5eBq5YQaNelR__m42KvpKolv7/view) 2.5min Video (Timestamp: 43:50 - 46:10)


[Schematic and Simulation Review Slide Link](https://docs.google.com/presentation/d/1yArg9eURDTD4U1TzQWk_HXc--uBOyANuxjhyyxrrQCk/edit?slide=id.g3f0ce36bc21_4_376#slide=id.g3f0ce36bc21_4_376)

[Schematic Review Video Link](https://youtu.be/nWU8KJn_Hf8)


[Layout Review Slide Link](https://docs.google.com/presentation/d/1-wRJ25tOpLcIwcqMKb84TJG7cVurhM7Yr_dMmYaoczU/edit?slide=id.g3f0ce36bc21_4_376#slide=id.g3f0ce36bc21_4_376)

[Layout Review Video Link](https://youtu.be/rO0A9EQpW5c)

## Team Members

We have created a [GitHub Organization for our team here](https://github.com/llhtimlam/Probton). Team members are also listed below for convenience.

| Name              | GitHub         | Discord       | Email       | Role |
| ----------------- | -------------- | ------------- | ------------- | ------------- |
| Tim Lam | @llhtimlam | timlam0531 | llhtimlam@gmail.com | Team Lead |
| Abraar | @abraaralam | abraaaar | a9raar@gmail.com | Analog Design |
| Nitin Indukuri | @nitin-indukuri | nitin_i | indukuri.nitin@gmail.com | Analog Design |
| Reza Setiabekti | @rtsetiabekti | rezasetiabekti8375 | rtsetiabekti@gmail.com | Interfacing |
| Ashmita Saha | @ashmita1509 | ash_1509 | ashmita03saha@gmail.com | Interfacing |
| Victoria Evelyn Tjhin | @victoriatjhin | vik_lyn_ | tjhinevelyn28@gmail.com | Digital & Analog Design |
| Annika Vednere | @anna-vee | anna_b75_06065 | annikav0985@gmail.com | Analog Design |
| KALAM, Tayeeb Bin | @tayeeb02 | CadMiuM#9906 | tayeebkalam@gmail.com | Analog Design |

## Pitch deck

<img src="Media\Presentation\Slide1.PNG" width="100%" alt="Slide1">
<img src="Media\Presentation\Slide2.PNG" width="100%" alt="Slide2">
<img src="Media\Presentation\Slide3.PNG" width="100%" alt="Slide3">
<img src="Media\Presentation\Slide4.PNG" width="100%" alt="Slide4">
<img src="Media\Presentation\Slide5.PNG" width="100%" alt="Slide5">
<img src="Media\Presentation\Slide6.PNG" width="100%" alt="Slide6">
<img src="Media\Presentation\Slide7.PNG" width="100%" alt="Slide7">
<img src="Media\Presentation\Slide8.PNG" width="100%" alt="Slide8">
<img src="Media\Presentation\Slide9.PNG" width="100%" alt="Slide9">
<img src="Media\Presentation\Slide10.PNG" width="100%" alt="Slide10">
<img src="Media\Presentation\Slide11.PNG" width="100%" alt="Slide11">
<img src="Media\Presentation\Slide12.PNG" width="100%" alt="Slide12">
<img src="Media\Presentation\Slide13.PNG" width="100%" alt="Slide13">
<img src="Media\Presentation\Slide14.PNG" width="100%" alt="Slide14">

### References

1. L. Ranno *et al.*, "Integrated Photonics Packaging: Challenges and Opportunities," *ACS Photonics*, vol. 9, no. 11, pp. 3467–3485, Oct. 2022. doi: [10.1021/acsphotonics.2c00891](https://doi.org/10.1021/acsphotonics.2c00891)

2. The Business Research Company, "Silicon Photonics Market Report 2026," Jan. 2026. [Online]. Available: [The Business Research Company](https://www.thebusinessresearchcompany.com/report/silicon-photonics-global-market-report)

3. H.-S. Liao *et al.*, "Low-cost, open-source XYZ nanopositioner for high-precision analytical applications," *HardwareX*, vol. 11, p. e00317, 2022. doi: [10.1016/j.ohx.2022.e00317](https://doi.org/10.1016/j.ohx.2022.e00317)

4. W.-M. Wang *et al.*, "Low-voltage and high-performance buzzer-scanner based streamlined atomic force microscope system," *Nanotechnology*, vol. 24, no. 45, p. 455503, Nov. 2013. doi: [10.1088/0957-4484/24/45/455503](https://doi.org/10.1088/0957-4484/24/45/455503)

5. J. Li, J. D. Valentine, and A. E. Rana, "The modified three point gaussian method for determining Gaussian peak parameters," *Nucl. Instrum. Methods Phys. Res. A*, vol. 422, no. 1–3, pp. 438–443, 1999. doi: [10.1016/S0168-9002(98)01113-9](https://doi.org/10.1016/S0168-9002(98)01113-9)

6. S. S. Rout, S. K. Mohapatra, and K. Sethi, "Design of 2.4 GHz Improved Current Reuse Gilbert Mixer with Source Degeneration Technique," Wireless Personal Communications, vol. 122, no. 4, pp. 3875–3887, 2022, doi: [10.1016/S0168-9002(98)01113-9](https://doi.org/10.1007/s11277-021-09115-6)

7. E. Altuner, I. S. Özoğuz, and M. B. Yelten,  "High-Linearity Gilbert-Cell Mixer Design for Cryogenic Applications," Analog Integrated Circuits and Signal Processing, vol. 113, no. 2, pp. 249–256, 2022, doi: [10.1007/s10470-022-02098-9](https://doi.org/10.1007/s10470-022-02098-9)
