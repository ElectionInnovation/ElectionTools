

numberOfWords <- function(x) {
  return(sapply(strsplit(x, " "), length))
}

nameInitials <- function(x) {
  substr(x, 0, 1)
}


firstName <- function(x, n = 1) {
  words = numberOfWords(x)
  if (words <= n) {
    return(NA)
    break()
  }
  name = substr(x = x, start = 0, stop = gregexpr(pattern = " ", text = x)[[1]][n]-1)
  return(name)
}

lastName <- function(x, n=1) {
  length = length(charToRaw(x))
  words = numberOfWords(x)
  if (words <= n) {
    return(NA)
    break()
  }
  name = substr(x = x, start = gregexpr(pattern = " ", text = x)[[1]][words-n]+1, stop = length)
  return(name)
}

matchNames <- function(x, y, z) {
  
}

