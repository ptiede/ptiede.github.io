# This file was generated, do not modify it. # hide
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