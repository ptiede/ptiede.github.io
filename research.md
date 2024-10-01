@def title = "Research"
@def hascode = true
@def date = Date(2024, 10, 1)
@def rss = "My Research Interests"

# Research

As a computational astrostatistician working on applying HPC and modern statistics to learn about the nature of compact astrophysical objects. My research aims to robustly solve inverse problems
that arise in every field of astronomy, while focussing on computational cost to ensure scalability to next generation instruments. Additionally, I am an avid Julia programmer, thanks to its
simple syntax and dynamic programming, while maintaining performance similar to C and Fortran. I have worked on several open source projects that are used in astronomy and organized a 
[Computation Radio Astronomy minisymposium at JuliaCon 2023](https://live.juliacon.org/talk/PUY3SP).


I am a member of several astronomy organizations including the [Event Horizon Telescope](https://eventhorizontelescope.org/) (EHT), [next-generation Event Horizon telescope](https://www.ngeht.org/) (ngEHT)
and potential space extensions like the [Black Hole Explorer](https://www.blackholeexplorer.org/) (BHEX) project. 


## Imaging Black Holes

Imaging black holes requires the use of *very long baseline interferometry* (VLBI) to correlate signals from several radio telescopes around the world
creating the highest possible resolution instruments. However, to create images from the data is a complex forward modeling problems that requires 
only modeling the non-linear instrument response for each telescope, the earth atmosphere, and the source itself. I have worked on and lead several projects
to improve the imaging of black holes.

Traditional VLBI imaging techniques include CLEAN deconvolution and Regularized Maximum likelihood methods do not give reliable error estimates
and have lead to various debates in the community about the relability of features in images. My focus is utilizing Bayesian inference techniques to solve the 
VLBI imaging problem in an automated fashion, while giving reliable error estimates. While Bayesian inference tends to be more computational expensive, I have
developed techniques and sofware packages to make the process more efficient. These techniques live in the open source Julia software package [Comrade](https://github.com/ptiede/Comrade.jl)
of which I am the primary developer and maintainer. Comrade improved the performance of the EHT imaging pipeline by 1-2 orders of magnitude and is has been used in various 
EHT publications including the first images of Sgr A*, the 2018 M87 image, the ongoing M87 2021 analysis of which I am the one of the project coordinators. 


## Bayesian Statistics

To ensure reliable and robust scientific results, I am a strong proponent of Bayesian statistics. However, one of the main challenges in using Bayesian statistics is the computational cost
and the relability of approximations. I have worked with statisticians and computer scientists to develop new algorithms that enable more robust posterior approximations, including 
the open source [Pigeons.jl](https://github.com/Julia-Tempering/Pigeons.jl) package, which utilizes a non-reversible parallel tempering scheme, in conjunction with MPI to enable 
scalable Bayesian inference for pathological posteriors.

I am also working with statisticians at Oxford ([Saiduddin Syed](https://www.saifsyed.com/)) to use novel Bayesian inference and machine learning techniques to improve data analysis for 
a variety of astronomical projects and inverse problems.

## High Performance Computing

I work with high performance computing specialist to interface my projects with modern compiler technology and HPC systems. I have worked with the [Enzyme LLVM auto-differentiation library](https://github.com/EnzymeAD)
enabling massive speed improvements relative to previous methods giving a talk at the inaugural [EnzymeCon 202](https://enzyme.mit.edu/talks/EnzymeCon/).


