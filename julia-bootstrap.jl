using Pkg

packages = [
 "Agents",
 "AgentsPlots",
 "Crayons",
 "DSP"
 "DataFrames",
 "DelimitedFiles",
 "DifferentialEquations",
 "DynamicGrids",
 "DynamicalSystems",
 "FFTW",
 "ImageFiltering",
 "ImageMagick",
 "Images",
 "InteractiveChaos",
 "KernelDensity",
 "LightGraphs",
 "LinearAlgebra",
 "Plots",
 "Pluto",
 "PlutoUI",
 "StatsBase",
 "TimeseriesPrediction",
 "UnicodePlots",
]

for i in packages
    Pkg.add(i)
end
