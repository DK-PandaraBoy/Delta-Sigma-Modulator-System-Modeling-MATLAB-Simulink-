Report: Delta–Sigma Modulator Toolbox


## Overview
This toolbox models first–third order current-mode delta–sigma modulators with modular Simulink blocks and automated MATLAB sweeps. The focus is on design trade-offs for ±10 nA, 4 MHz bandwidth signals.


## Example Configurations
- **2nd-order, 1-bit, OSR=64** → baseline configuration.
- **3rd-order, 2-bit, OSR=128** → improved SNR/ENOB, higher complexity.


## Results Summary
- Increasing **OSR** improves in-band noise shaping.
- Higher **quantizer resolution** provides incremental SNR improvement but at circuit cost.
- Example data (from `data/sample_results.csv`):


| OSR | Bits | Order | SNR (dB) | ENOB |
|-----|------|-------|----------|------|
| 32 | 1 | 3 | 45.2 | 7.39 |
| 64 | 1 | 3 | 52.8 | 8.58 |
| 128 | 1 | 3 | 59.1 | 9.36 |
| 64 | 2 | 3 | 59.9 | 9.69 |
| 128 | 2 | 3 | 66.3 | 11.03 |


## Generated Figures


### SNR vs OSR (by quantizer bits)
![SNR vs OSR](figures/snr_vs_osr.png)


### ENOB vs OSR (by quantizer bits)
![ENOB vs OSR](figures/enob_vs_osr.png)


## How to reproduce
1. Run `setup.m`.
2. Run `scripts/run_all.m` to generate sweep data.
3. Run `scripts/plot_results.m` to generate plots.
4. View `docs/figures/` for figures, and inspect `data/sample_results.csv`.
