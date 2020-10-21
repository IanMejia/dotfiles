using Pkg

packages = [
 "Agents",
 "Crayons",
 "DataFrames",
 "DifferentialEquations",
 "DSP",
 "DynamicGrids",
 "DynamicalSystems",
 "FFTW",
 "ImageFiltering",
 "ImageMagick",
 "Images",
 "InteractiveChaos",
 "LinearAlgebra",
 "Plots",
 "Pluto",
 "PlutoUI",
 "QuantumOpticsBase",
 "SymEngine",
 "TimeseriesPrediction",
 "UnicodePlots"
]

for i in packages
    Pkg.add(i)
end
