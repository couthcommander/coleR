#'Width Options
#'
#'Set maximum number of columns on a line.
#'
#'@param width Integer. Defaults to 140.
#'@export
setWidth <- function(width=140) {
  options(width=width)
}

#'Menu Graphics
#'
#'Set menu.graphics option.
#'
#'@param use Logical. Defaults to FALSE.
#'@export
setMenuGraphics <- function(use=FALSE) {
  options(menu.graphics=use)
}

#'Continue Prompt
#'
#'Set prompt for lines which continue over one line.
#'
#'@param prompt Character. Defaults to four spaces.
#'@export
setContinue <- function(prompt="    ") {
  options(continue=prompt)
}
