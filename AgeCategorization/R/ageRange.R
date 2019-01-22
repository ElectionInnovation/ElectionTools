ofile <- file("output.txt")
vlist <- readLines(ofile)
voterlist <- read.csv(vlist, as.is = T)

Age_Range  <- function(age) {
  if (as.numeric(age) >= 18 && as.numeric(age) < 25) {
    age <- "18-24"
  }
  else if (as.numeric(age) >= 25 && as.numeric(age) < 35) {
    age <- "25-34"
  }
  else if (as.numeric(age) >= 35 && as.numeric(age) < 45) {
    age <- "35-44"
  }
  else if (as.numeric(age) >= 45 && as.numeric(age) < 55) {
    age <- "45-54"
  }
  else if (as.numeric(age) >= 55 && as.numeric(age) < 65) {
    age <- "55-64"
  }
  else if (as.numeric(age) >= 65 && as.numeric(age) < 115) {
    age <- "65+"
  }
  else {
    age <- round(as.numeric(age))
  }
  return(age)
}
voterlist$Age  <- unlist(parallel::mclapply(voterlist$Age, Age_Range, mc.cores=4))
write.csv(voterlist, vlist)
