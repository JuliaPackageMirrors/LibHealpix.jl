# Copyright (c) 2015 Michael Eastwood
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

__precompile__()

module LibHealpix

export HealpixMap, pixels, nside, npix, nring, isring, isnest
export Alm, coefficients, lmax, mmax
export npix2nside, nside2npix
export map2alm, alm2map
export writehealpix, readhealpix
export mollweide

importall Base.Operators
import Base: length, pointer

function __init__()
    usr_lib = joinpath(dirname(@__FILE__), "../deps/usr/lib")
    global const libchealpix       = Libdl.find_library(["libchealpix"],       [usr_lib])
    global const libhealpixwrapper = Libdl.find_library(["libhealpixwrapper"], [usr_lib])
end

include("pixel.jl")
include("map.jl")
include("alm.jl")
include("transforms.jl")
include("mollweide.jl")

end

