using Pkg

packages = [
 "DifferentialEquations",
 "TimeseriesPrediction",
 "DynamicalSystems",
 "InteractiveChaos",
 "ImageFiltering",
 "DelimitedFiles",
 "LinearAlgebra",
 "KernelDensity",
 "DynamicGrids",
 "UnicodePlots",
 "AgentsPlots",
 "ImageMagick",
 "LightGraphs",
 "DataFrames",
 "StatsBase",
 "Crayons",
 "PlutoUI",
 "Images",
 "Agents",
 "Plots",
 "Pluto",
 "FFTW",
 "DSP"
]

for i in packages
    Pkg.add(i)
end
