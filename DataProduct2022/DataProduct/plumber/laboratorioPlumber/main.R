library(plumber)

r <- plumb("laboratorioPlumber.R")

r$run(port=8001)
