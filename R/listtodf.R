#'List to data.frame
#'
#'Convert a list containing similar data.frames into a single
#'data.frame object.
#'
#'@param x list containing data.frames
#'@return data.frame
#'@export
#'@examples
#'df <- data.frame(id=1:10, val=rnorm(10))
#'x <- list(df, df[sample(nrow(df)),], df[sample(nrow(df), 4),])
#'listtodf(x)

listtodf <- function(x) {
  ## Simplified version of IRanges's rbind method for DataFrame
  ## Removed all data checks, ignored row names
  df <- x[[1L]]
  cn <- colnames(df)
  cl <- unlist(lapply(as.list(df, use.names = FALSE), class))
  factors <- unlist(lapply(as.list(df, use.names = FALSE), is.factor))
  cols <- lapply(seq_len(length(df)), function(i) {
    cols <- lapply(x, `[[`, cn[i])
    if (factors[i]) { # combine factor levels, coerce to character
      levs <- unique(unlist(lapply(cols, levels), use.names=FALSE))
      cols <- lapply(cols, as.character)
    }
    combined <- do.call(c, unname(cols))
    if (factors[i])
      combined <- factor(combined, levs)
    as(combined, cl[i])
  })
  names(cols) <- colnames(df)
  do.call(data.frame, cols)
}
