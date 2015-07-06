#'Grow Matrix
#'
#'Extend the rows and columns of a matrix by a value.
#'@param x Matrix.
#'@param data Value to insert into new elements.
#'@param nrow Integer. Number of rows to add.
#'@param ncol Integer. Number of columns to add.
#'@export
#'@examples
#'mat <- matrix(seq(16), nrow=4)
#'grow.matrix(mat, nrow=2)
#'grow.matrix(mat, 0, nrow=4, ncol=2)
#'grow.matrix(mat, -1, nrow=0, ncol=2)
grow.matrix <- function(x, data=NA, nrow=1, ncol=nrow) {
  rowvals <- rep(data, nrow)
  colvals <- rep(data, ncol)
  x <- do.call("cbind", c(list(x), colvals))
  do.call("rbind", c(list(x), rowvals))
}
