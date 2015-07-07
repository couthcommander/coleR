#'Paste Rows
#'
#'Paste elements in each row together.
#'@param x Matrix or data.frame.
#'@param collapse Character. String to separate column values.
#'@param digits Integer. Number of decimal places to use for floating-
#'point numbers.
#'@export
#'@examples
#'df <- data.frame(id=1:10, vals=rnorm(10))
#'paste.rows(df, '|')
#'paste.rows(df, '|', 5)
paste.rows <- function(x, collapse=" ", digits=NA) {
  if(grepl("%", collapse)) collapse <- gsub("%", "%%", collapse)
  types <- rep("%s", ncol(x))
  if(!is.na(digits)) {
    num.cols <- unname(which(sapply(x, is.numeric)))
    # faster method?
    if(length(num.cols)) {
      int.cols <- unname(which(apply(x[,num.cols,drop=FALSE], 2, function(i) {
        all(i == ceiling(i))
      })))
      num.cols <- setdiff(num.cols, int.cols)
      types[int.cols] <- "%d"
      types[num.cols] <- sprintf("%%.%sf", digits)
    }
  }
  str <- paste(types, collapse=collapse)
  vsprintf(str, x)
}
