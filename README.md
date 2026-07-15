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

Size: 1100um x 1100um (estimate) - Block type A

Required pins: 22

<img src="Media\ChipArchitect\Optical Probe Station Chip Architect.png" width="100%" alt="Proposed Chip Architect">

> Check /Media/ChipArchitect for detailed chip architect diagram

> Check /src and /Analog/schematics for digital and analog circuit design files

> For detail on navigating the chip design file, follow the README.md in /scripts folder

> For Digital Verilog Cocotb Simulation Result, follow the README.md in /cocotb folder

## Schematic Review

Video for Schematic Review: [Youtube](https://youtu.be/nWU8KJn_Hf8)

<video src="https://youtu.be/nWU8KJn_Hf8" controls="controls" width="100%">
</video>


### Simulation result

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

## Links

- [Project Repository](https://github.com/llhtimlam/Probton)
- [Proposal](https://docs.google.com/presentation/d/1my20nb1kIsFqFrcN5mZosZAiVzRqFzaXHJhg6WDKTtg/edit?slide=id.g3ea99befb0f_0_14#slide=id.g3ea99befb0f_0_14)
- [Progress Tracker](https://app.notion.com/p/abraaralam/Probton-Home-377a16d0b43280fa8b21c942e25e7d73)

## Team Members

We have created a [GitHub Organization for our team here](https://github.com/llhtimlam/Probton). Team members are also listed below for convenience.

| Name              | GitHub         | Discord       | Email       | Role |
| ----------------- | -------------- | ------------- | ------------- | ------------- |
| Tim Lam | @llhtimlam | timlam0531 | llhtimlam@gmail.com | Team Lead |
| Abraar | @abraaralam | abraaaar | a9raar@gmail.com | Analog Design |
| Belkacem Benadda | @bekaben | belkaem | belkacem.benadda@ieee.org | Digital & Analog Design |
| Nitin Indukuri | @nitin-indukuri | nitin_i | indukuri.nitin@gmail.com | Analog Design |
| Reza Setiabekti | @rtsetiabekti | rezasetiabekti8375 | rtsetiabekti@gmail.com | Interfacing |
| Ashmita Saha | @ashmita1509 | ash_1509 | ashmita03saha@gmail.com | Interfacing |
| Victoria Evelyn Tjhin | @victoriatjhin | vik_lyn_ | tjhinevelyn28@gmail.com | Digital & Analog Design |
| Annika Vednere | @anna-vee | anna_b75_06065 | annikav0985@gmail.com | Analog Design |
| KALAM, Tayeeb Bin | @tayeeb02 | CadMiuM#9906 | tayeebkalam@gmail.com | Analog Design |

### References

1. L. Ranno *et al.*, "Integrated Photonics Packaging: Challenges and Opportunities," *ACS Photonics*, vol. 9, no. 11, pp. 3467–3485, Oct. 2022. doi: [10.1021/acsphotonics.2c00891](https://doi.org/10.1021/acsphotonics.2c00891)

2. The Business Research Company, "Silicon Photonics Market Report 2026," Jan. 2026. [Online]. Available: [The Business Research Company](https://www.thebusinessresearchcompany.com/report/silicon-photonics-global-market-report)

3. H.-S. Liao *et al.*, "Low-cost, open-source XYZ nanopositioner for high-precision analytical applications," *HardwareX*, vol. 11, p. e00317, 2022. doi: [10.1016/j.ohx.2022.e00317](https://doi.org/10.1016/j.ohx.2022.e00317)

4. W.-M. Wang *et al.*, "Low-voltage and high-performance buzzer-scanner based streamlined atomic force microscope system," *Nanotechnology*, vol. 24, no. 45, p. 455503, Nov. 2013. doi: [10.1088/0957-4484/24/45/455503](https://doi.org/10.1088/0957-4484/24/45/455503)

5. J. Li, J. D. Valentine, and A. E. Rana, "The modified three point gaussian method for determining Gaussian peak parameters," *Nucl. Instrum. Methods Phys. Res. A*, vol. 422, no. 1–3, pp. 438–443, 1999. doi: [10.1016/S0168-9002(98)01113-9](https://doi.org/10.1016/S0168-9002(98)01113-9)

6. S. S. Rout, S. K. Mohapatra, and K. Sethi, "Design of 2.4 GHz Improved Current Reuse Gilbert Mixer with Source Degeneration Technique," Wireless Personal Communications, vol. 122, no. 4, pp. 3875–3887, 2022, doi: [10.1016/S0168-9002(98)01113-9](https://doi.org/10.1007/s11277-021-09115-6)

7. E. Altuner, I. S. Özoğuz, and M. B. Yelten,  "High-Linearity Gilbert-Cell Mixer Design for Cryogenic Applications," Analog Integrated Circuits and Signal Processing, vol. 113, no. 2, pp. 249–256, 2022, doi: [10.1007/s10470-022-02098-9](https://doi.org/10.1007/s10470-022-02098-9)