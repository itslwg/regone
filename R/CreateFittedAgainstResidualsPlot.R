#' CreateFittedAgainstResidualspLot
#'
#' Creates and returns a plot with fitted against residuals plot.
#' @param plot.data data.frame object. Containing the externally studentized residuals, and the fitted response varibles. No default.
#' @param save.plot Logical vector of length 1. If TRUE then the plot is saved to disk. Defaults to TRUE
#' @export
CreateFittedAgainstResidualsPlot <- function(plot.data, save.plot = TRUE) {
    ## Error handling
    if (!all(c("r.student", "predicted") %in% names(plot.data)))
        stop("Columns r.student and predicted representing the externally studentized residuals and the fitted values, respectively, must be in plot.data.")
    plt <- plot.data %>%
        ggplot2::ggplot(ggplot2::aes(x = predicted, y = r.student)) +
        ggplot2::geom_point() +
        ggplot2::geom_hline(yintercept = 0)
    if (save.plot)
        ggplot2::ggsave("fitted_against_residuals.png", plt)
    return(plt)
}