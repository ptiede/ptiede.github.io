@def title = "Software"

# Software

I am an avid proponent of open source software and have started numerous projects used by telescopes such as the Event Horizon Telescope.
I am also one of the leaders of the [EHTJulia organization](https://github.com/EHTJulia), which is a collection of Julia packages for 
analyzing any VLBI data, but is currently focused on the Event Horizon Telescope and potential future upgrades including the ngEHT and BHEX projects.
Below I highlight some of the core software projects I have worked on.

For a complete list of projects please see my [GitHub page](https://github.com/ptiede?tab=overview&from=2024-08-01&to=2024-08-31).


## Comrade

[Comrade](https://github.com/ptiede/Comrade.jl) is a VLBI imaging and calibration package written in Julia. It is designed to be a modern, flexible, and fast package for analyzing VLBI data.
Comrade is highly performant and is 1-2 orders of magnitude faster than other packages commonly used by the EHT, including Themis and eht-imaging.
Thanks to interfacing with the Enzyme automatic differentiation library, Comrade is able entirely autodifferentiable and doesn't require specialized 
DSL's like JAX or Stan to be used. 

Comrade is entirely open source and its [documentation](https://ptiede.github.io/Comrade.jl/v0.10.4/) includes various tutorials and examples.

From a VLBI standpoint Comrade also attempts to not only solve for the radio image and but the instrument response. Namely, it will perform joint calibration and imaging step.
The calibration is also unique since it can handle a variety of instrumental effects including gains, gain ratios, leakage, and even non-circular polarization bases.

## Themis

Themis is Bayesian inference PPL for analyzing VLBI data. It is written in C++ and is currently widely used in the EHT.
I was responsible for implementing various features in Themis including:

- Writing the entire sampling backend and interfacing with the Stan library. This included interfacing Stan into the modern non-reversible parallel tempering algorithm detailed in [Syed et al. 2021](https://arxiv.org/abs/1905.02939). This sampler was used to produce the first polarized images of M87 and Sgr A*. The extension also allows for MPI parallelism and has been used on thousands of cores on Compute Canada's supercomputers, Harvards FASRC, and many others.
- Implementing various geometric models and frequency dependent models for the EHT.
- Maintenance of the code and various bug fixes

## VIDA

VIDA is a Julia package that aims to extract features from images using template matching. It has become a part of the standard imaging evaluation pipeline for the EHT and have been used
in the [M87 2018](https://www.aanda.org/articles/aa/full_html/2024/01/aa47932-23/aa47932-23.html) publication, [Sgr A*](https://iopscience.iop.org/journal/2041-8205/page/Focus_on_First_Sgr_A_Results), 
and many on-going EHT projects.




