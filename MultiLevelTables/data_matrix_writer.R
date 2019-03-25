writeFirstRow <- function(data, column) {
  skipCols <- length(data)-2
  marker <- 1
  firstRow <- ""
  while (marker <= skipCols) {
    firstRow <- append(firstRow, " ,")
    marker <- marker+1
  }
  for (i in levels(data[, column])) {
    firstRow <- append(firstRow, paste0(i, ','))
  }
  return(paste0(firstRow, collapse = ""))
}


writeRows <- function(data, column,row, rows, conn) {
  #determination of non-primary columns
  nonprimary <- names(data[, names(data) %in% c(column, row) != T])
  nonprimary <- nonprimary[nonprimary != "Freq"]
  
  skipCols <- length(data)-2
  col <- 1
  current_row <- ""
  current_row <- append(current_row, rows)
  for (subcolumns in nonprimary) {
    for (subrows in levels(data[,subcolumns])) {
      current_row <- append(current_row, subrows)
      for (current_column in levels(data[, column])) {
        present_value <- data[as.character(data[, row]) == rows & 
                                as.character(data[, column]) == current_column &
                                as.character(data[, subcolumns]) == subrows,]$Freq
        current_row <- append(current_row, present_value)
        
      }
      cat(paste0(current_row[2:length(current_row)], collapse = ','), file = conn, sep = "\n", append = T)
      current_row <- ""
      current_row <- append(current_row, rows)
      
    }
  } 
}


write.matrix.csv <- function(matrix, column, row, filename) {
  data <- as.data.frame(matrix)
  # write the first row
  firstRow <- writeFirstRow(data, column)
  cat(firstRow, file = filename, sep = "\n")
  for (rows in levels(data[,row])) {
    writeRows(data, column, row, rows, filename) 
  }
  
}