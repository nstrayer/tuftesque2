
#' tuftesque
#' Generate Rmarkdown report with sidenotes and mobile friendly views.
#'
#' @return Rendered RMarkdown report.
#' @export
#'
#' @examples
#' tuftesque2::tuftesque()
tuftesque = function() {

  # locations of resource files in the package
  pkg_resource = function(...) {
    system.file(..., package = "tuftesque2")
  }

  css <- pkg_resource("tuftesque.css")
  html_template <- pkg_resource('tuftesque.html')

  pandoc_options <- rmarkdown::pandoc_options(
    to = "html"
  )

  knit_options <- rmarkdown::knitr_options(
    knit_hooks = list(
      class = function(before, options, envir) {
        # Add a class for chunk output
        is_sidenote <- grepl('side-note', options$class)
        is_lightbox <- grepl('lightbox', options$class)

        # If we have both a side-note and a lightbox tag at the same time put two divs instead of one
        # The first one is the side-note div and the second is the lightbox div.
        if (before) {
          if (is_sidenote & is_lightbox) {
            open_tag <- "<div class = 'side-note'><div class = 'lightbox'>";
          } else {
            open_tag <- sprintf("<div class = '%s'>", options$class)
          }
          return(open_tag)
        } else{
          if (is_sidenote & is_lightbox) {
            close_tag <- "</div> </div>";
          } else {
            close_tag <- "</div>";
          }
          return(close_tag)
        }
      }
    )
  )

  rmarkdown::output_format(
    knitr = knit_options,
    pandoc = pandoc_options,
    base_format = rmarkdown::html_document(
        theme = NULL,
        css = css,
        template = html_template
      )
  )
}




