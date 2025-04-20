#' boxfish
#'
#' This Shiny App will compare chemical amounts across categories
#'
#' @return a plot with grouped boxplots
#' @export
#'
#' @importFrom shiny runApp
#'
#' @examples \dontrun{mercfish()}
boxfish <- function() {
  runApp(system.file("mercfish",
                     package = "rosaFinalProject"),
         launch.browser = TRUE)
}
