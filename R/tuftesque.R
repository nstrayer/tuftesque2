#' @importFrom rmarkdown output_format knitr_options pandoc_options
tuftesque = function() {

  # locations of resource files in the package
  pkg_resource = function(...) {
    system.file(..., package = "tuftesque2")
  }

  css    = pkg_resource("tuftesque.css")

  # call the base html_document function
  rmarkdown::html_document(
    theme = NULL, css = css
  )
}
