@def title = "Software"
@def tags = ["software"]

# Software

I have experience with C++ and Python although my main programming language currently is Julia. Julia is a recent language that has performance comparable to optimized C code, but with friendly syntax and a abstract type system that makes it easy to construct generic code. 

\toc

## Themis
Themis is the Bayesian inference package written in C++ that is used for analyzing data from the Event Horizon Telescope. I am one of the core developers of Themis having written numerous models and most of the samplers.

Themis has been used for many of the biggest EHT results. Many of the quantitative results from the first EHT results on M 87 where due to Themis. One example is the Mass of M 87. 


## VIDA

VIDA is a tool for feature extraction from image reconstruction of EHT data. This is needed because the current imaging techniques are extremely flexible. While this flexibility is a great feature to have it means that extracting important features (e.g. the diameter of the ring) is difficult. To help automate feature extraction I developed a tools called *Variational Image Domain Analysis* or VIDA. VIDA works by approximating the image with parameterized models or **filters** ,$f_\theta$, such as Gaussians, ring, disks, etc. and then finds the optimal parameters. For optimality we take inspiration from variational inference and use probability divergences as our objective function. 

Currently VIDA has two divergences implemented:
 - [Bhattacharyya divergence](https://en.wikipedia.org/wiki/Bhattacharyya_distance)
 $$
    Bh(p||q) = -\log \int \sqrt{p(x)q(x)}dx
 $$
 - [Kullback Leibler](https://en.wikipedia.org/wiki/Kullback%E2%80%93Leibler_divergence) divergence
 $$
    KL(p||q) = \int p(x)\log\left(\frac{p(x)}{q(x)}\right).
 $$
 In my experiments I have found that the Bhattacharyya divergence is easier to optimize than the KL divergence.

More to come...

 ### Example script

```julia:./vidaex.jl
using VIDA
using Plots
# Lets create a filter or approximate image
θ = GaussianRing(r0 = 20.0, 
                 σ = 5.0,
                 x0= 5.0,
                 y0 = 6.0)

# We can easily plot this using the Plots.jl package
plot(θ, title="Example filter")
savefig(joinpath("/home/ptiede/MySite/ptiede.github.io/MySite2/__site/assets/software/code", "img.svg")) # hide

# Let's now make a sample image with some random noise
img = VIDA.make_ehtimage(θ, 64, [-60.0,60.0],[-60.0,60.0])
img.img .*=  exp.(randn(64,64)*0.2)

# Plotting the image gives
plot(img, title="Example filter with noise")
savefig(joinpath("/home/ptiede/MySite/ptiede.github.io/MySite2/__site/assets/software/code", "img2.svg")) # hide

# Now let's try to extract the ring parameters
# First constuct the divergence from the img
bh = Bhattacharyya(img)

# Construct the search bounds
θlower = GaussianRing(r0=0.1,
                      σ = 0.01,
                      x0=-60.0,
                      y0=-60.0)
θupper = GaussianRing(r0=40,
                      σ = 20,
                      x0=60.0,
                      y0=60.0)

# Now find the optimal filter and plot it
θopt,_ = bbextract(bh, θ, θlower, θupper)
a = triptic(img, θopt)
title!(a[1], "Image")
title!(a[2], "Optimal Filter")
title!(a[3], "Chords")
savefig(joinpath("/home/ptiede/MySite/ptiede.github.io/MySite2/__site/assets/software/code", "triptic.svg")) # hide
```
\fig{img}
\fig{img2}
\fig{triptic}


