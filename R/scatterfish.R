#' scatterfish
#'
#' This Shiny App Will Perform SLR Between Chemical Concentrations and Color by Group
#'
#' @return a scatterplot with colored groups
#' @export
#'
#' @importFrom shiny runApp
#'
#' @examples \dontrun{scatterfish()}
scatterfish <- function() {
  runApp(system.file("scatterfish",
                     package = "rosaFinalProject"),
         launch.browser = TRUE)
}
