Small modular MATLAB/Simulink toolbox for current-mode ΔΣ modulators (1st–3rd order). Features:


- Modular building blocks (integrators, quantizer, feedback DAC, noise source).
- Scripted Simulink model builder (`build_modulator_model.m`).
- Automated parameter sweeps for OSR (32–128) and quantizer resolution (1–3 bits).
- Extraction of ENOB / SNR and NTF estimation.


## Quickstart


1. Add repo to MATLAB path or run `setup.m`.
2. Run `scripts/run_example.m` to build a 2nd-order 1-bit modulator demo and simulate.
3. Run `scripts/run_all.m` to sweep OSR and quantizer bits (default ranges: OSR=[32,64,128], bits=[1,2,3]).


## Structure
See repository tree in repository root.


## License
MIT
### `LICENSE`
```text
MIT License


Copyright (c) 2025 DK-PandaraBoy


Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:


[standard MIT text truncated for brevity — replace with full text when publishing]
