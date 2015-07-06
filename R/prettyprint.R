#'Pretty Print
#'
#'Print objects with a SQL-like format.
#'
#'@param x A data.frame or matrix. Object to print.
#'@param labels A character vector. Column names.
#'@export
#'@examples
#'df <- data.frame(id=1:10, vals=rnorm(10))
#'prettyprint(df)
#'prettyprint(df, c('ID','RANDOM VALUES'))
prettyprint <- function(x, labels) {
  x <- data.frame(x)
  sz <- ncol(x)
  if(!missing(labels)) names(x)[seq_along(labels)] <- labels
  size <- sapply(seq(sz), FUN=function(i) max(nchar(c(names(x)[i], as.character(x[[i]]))))) + 2
  newrow <- sprintf("+%s+", paste(sapply(size, FUN=function(i) paste(rep('-',i), collapse='')), collapse='+'))
  rowPr <- sapply(size, FUN=function(i) sprintf("%%%ss ", i-1))
  header <- sprintf("|%s|", paste(sapply(seq(sz), FUN=function(j) sprintf(rowPr[j], names(x)[j])), collapse='|'))
  content <- sprintf("|%s|", apply(x, MARGIN=1, FUN=function(i) paste(sapply(seq(sz), FUN=function(j) sprintf(rowPr[j], i[j])), collapse='|')))
  cat(paste(c(newrow, header, newrow, content, newrow), collapse='\n'), "\n")
}
