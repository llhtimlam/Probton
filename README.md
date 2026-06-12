# **Probton** - ASIC Solution for Optical Probe Station for Photonic Integrated Circuits Packaging and Testing
### [2026 Chipathon SSCS PICO](https://sscs.ieee.org/technical-committees/tc-ose/sscs-pico-design-contest/) - Track B (Circuit for Sensors) - Team B18 Probton

## Project Description
Our goal is to develop an open-source ASIC for auto aligner. In our demonstraction we are targeting optical probe stations where it reads photodetector signals, extracts vibration-synchronous alignment error from dither motion, estimates the peak offset, and drives a high speed and accuracy real-time alignment correction.

<img src="Chart\Optical Probe Station Real Setup.png" width="100%" alt="Optical Probe Station Setup">

## Problem Statement
Photonic packaging and integration are becoming increasingly important as Co-Packaging Optics (CPO) grows, but scalable alignment and testing remain difficult. Current alignment approaches are often specialized and not yet built for high-volume throughput.

High-volume CPO production may require hundreds of active alignments per module, scaling to millions of modules per month in large fabs. Existing setups typically rely on expensive, discrete desktop instrument boxes with proprietary hardware controllers and separate optical power meters.

There is a clear need for a low-cost hardware solution that performs alignment-error processing close to the sensor—enabling nanometer-precision alignment under real-time environmental disturbance, mechanical drift, and tight timing constraints.

## Value Preposition
Our ASIC provides an open-source, edge-processed feedback control loop for optical probe stations. By moving error demodulation and computation from external software into localized hardware, we eliminate data-bus latency and substantially improve alignment speed.

This offers a low-cost, integrable alternative to proprietary alignment hardware.

<img src="Chart\Optical Probe Station Validation Setup.png" width="100%" alt="Optical Probe Station Setup">

## Chip Architect

Size: 1100um x 1100um (estimate) - Block type A

Required pins: 22

<img src="Chart\Optical Probe Station Full Design.png" width="100%" alt="Proposed Chip Architect">

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
| Belkacem Benadda | @bekaben | belkaem | belkacem.benadda@ieee.org | Analog Design |
| Nitin Indukuri | @nitin-indukuri | nitin_i | indukuri.nitin@gmail.com | Analog Design |
| Reza Setiabekti | @rtsetiabekti | rezasetiabekti8375 | rtsetiabekti@gmail.com | Interfacing |
| Ashmita Saha | @ashmita1509 | ash_1509 | ashmita03saha@gmail.com | Interfacing |
| Victoria Evelyn Tjhin | @victoriatjhin | vik_lyn_ | tjhinevelyn28@gmail.com | Digital & Analog Design |
| Annika Vednere | @anna-vee | anna_b75_06065 | annikav0985@gmail.com | Analog Design |
| KALAM, Tayeeb Bin | @tayeeb02 | CadMiuM#9906 | tayeebkalam@gmail.com | Analog Design |

### Simulation result

Convergence Step = 5.7 ± 1.1 @ 1% Transmission loss

<img src="Chart\Optical Probe Station Simulation.png" width="100%" alt="Simulation Result">

<img src="Chart\Optical Probe Station Monte Carlo Simulation.png" width="100%" alt="Monte Carlo Simulation">
