#'Vector sprintf
#'
#'Pass vector of values into \code{\link{sprintf}}.
#'@param fmt Character vector.  Argument to \code{sprintf}.
#'@param vals Vector of values to be displayed.
#'@export
#'@examples
#'vsprintf("One year to a %s is worth %s years%s", c('dog',7,'!'))
#'df <- data.frame(animal=c('dog','cat','fish'), years=c(7,5,13), ending=c('!','.','?'))
#'vsprintf("One year to a %s is worth %s years%s", df)
vsprintf <- function(fmt, vals) {
  do.call(sprintf, c(fmt, as.list(vals)))
}
