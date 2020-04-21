library(plumber)

r <- plumb("/home/rajat/Wind/plumber.R")
r$run(host= "0.0.0.0", port= 8383)