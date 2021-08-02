#' install_cmdline
#'
#' @param profile_path path to profile (default: ~/.bash_profile)
#'
#' @return
#' @export
#' @importFrom glue glue
#' @importFrom stringr str_detect
#' @examples
install_cmdline <- function(profile_path = '~/.bash_profile') {
  cmdline_path <- dirname(system.file("visualize_gradient_table", package = "visualizeGradientTable"))
  if (str_detect(Sys.getenv('PATH'), cmdline_path)) {
    stop(glue("Already installed. {cmdline_path} is already added to environment PATH in {profile_path}"))
  } else {
    path <- glue('export PATH=$PATH:{cmdline_path}\n')
    cat(path, file = profile_path, append = TRUE)
  }
}
