# LibHealpix

[![Build Status](https://travis-ci.org/mweastwood/LibHealpix.jl.svg?branch=master)](https://travis-ci.org/mweastwood/LibHealpix.jl)
[![codecov](https://codecov.io/gh/mweastwood/LibHealpix.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/mweastwood/LibHealpix.jl)
[![License](https://img.shields.io/badge/license-GPLv3%2B-blue.svg)](LICENSE.md)

> Healpix is an acronym for Hierarchical Equal Area isoLatitude Pixelization of a sphere.
> As suggested in the name, this pixelization produces a subdivision of a spherical
> surface in which each pixel covers the same surface area as every other pixel.

![A HealpixMap in Mollweide projection](example.png)

## Getting Started

To get started using LibHealpix, run:
```julia
Pkg.add("LibHealpix")
Pkg.test("LibHealpix")
using LibHealpix
```

The build process will attempt to download and build the [Healpix](http://healpix.sourceforge.net) library.

## Examples

### Creating a Map
```julia
using LibHealpix
nside = 16
map = HealpixMap(Float64, nside)
for i = 1:length(map)
    map[i] = i
end
```

### Spherical Harmonic Transforms
```julia
using LibHealpix
lmax = mmax = 10
alm = Alm(Complex128, lmax, mmax)
for m = 0:mmax, l = m:lmax
    alm[l,m] = l + m
end
nside = 16
map = alm2map(alm, nside)
blm = map2alm(map, lmax, mmax)
```

### FITS I/O
```julia
using LibHealpix
map = readhealpix("map.fits")
writehealpix("othermap.fits", map)
```

### Visualization
```julia
using LibHealpix
using PyPlot # for imshow(...)
map = HealpixMap(Float64, nside)
for i = 1:length(map)
    map[i] = rand()
end
img = mollweide(map)
imshow(img)
```

## Development
This package is very much a work in progress. Only a small part of the Healpix library is currently wrapped.
Please open issues or pull requests for missing functionality.

