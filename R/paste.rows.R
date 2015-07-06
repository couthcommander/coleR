#'Paste Rows
#'
#'Paste elements in each row together.
#'@param x Matrix or data.frame.
#'@param collapse Character. String to separate column values.
#'@export
#'@examples
#'df <- data.frame(id=1:10, vals=rnorm(10))
#'paste.rows(df, '|')
paste.rows <- function(x, collapse=" ") {
  if(grepl("%", collapse)) collapse <- gsub("%", "%%", collapse)
  str <- paste(rep("%s", ncol(x)), collapse=collapse)
  vsprintf(str, x)
}
