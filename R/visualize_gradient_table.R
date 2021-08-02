#' visualize_gradient_table
#'
#' @param in_bvals path to bvals
#' @param in_bvecs path to bvecs
#' @param out_path path to output html file
#'
#' @return
#' @export
#' @import dplyr tidyr
#' @importFrom plotly plot_ly
#' @importFrom htmlwidgets saveWidgets
#' @examples
visualize_gradient_table <- function(in_bvals, in_bvecs, out_path = NULL) {

  #pkgs <- c("dplyr", "tidyr", "plotly")
  #xfun::pkg_attach2(pkgs, message = F)

  df_bvals <- read.table(in_bvals)
  df_bvecs <- read.table(in_bvecs)
  df <- as.data.frame(t(rbind(df_bvals, df_bvecs)))
  colnames(df) <- c('bval', 'x', 'y', 'z')

  df <- df %>%
    mutate(w = sqrt(bval / max(df$bval)),
           x_w = x * w,
           y_w = y * w,
           z_w = z * w)

  n_shells <- length(unique(unlist(df_bvals)))
  cat(n_shells)
  fig <- plot_ly(df, x = ~x_w, y = ~y_w, z = ~z_w, color = ~as.factor(bval), colors = RColorBrewer::brewer.pal(n_shells, 'Paired')) %>%
    layout(title = "Weighted Directions")

  if (!is.null(out_path)) {
    saveWidget(as_widget(fig), out_path)
  }

  return(fig)

}
