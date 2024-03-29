#' Function to plot coloured geometries on a leaflet map
#'
#' This function is a wrapper around \code{\link[gissr]{leaflet_plot}} that allows geometries to be coloured according to a variable.
#' Discrete and continuous scales are supported.
#'
#' @param st Object with class \code{sf} or \code{sfc}.
#'
#' @param colour_by Variable to colour geometries by.
#'
#' @param palette Colours that values will be mapped to.
#'
#' @param popup Vector of variables to be used as a pop-up on the map.
#'
#' @param opacity Stroke opacity (edge of geometry).
#'
#' @param fill_opacity Fill opacity (inside of geometry).
#'
#' @return Leaflet map.
#'
#' @author Shona Wilde
#'
#' @seealso \code{\link[gissr]{leaflet_plot}}, \code{\link[leaflet]{colorNumeric}}
#'
#' @export

leaflet_plot_coloured <- function(st, colour_by = "value", palette = "plasma", popup = NULL, opacity = 0.5, fill_opacity = 0.2) {


  colour_var <- sym(colour_by)

  domain <- st %>%
    pull(!!colour_var)


  # set palette  based on continuous or discrete variables
  if (class(domain) %in% c("integer", "numeric"))

  {
    pal <- leaflet::colorNumeric(
      palette = palette,
      domain = domain
    )

  }

  else {

    pal <- leaflet::colorFactor(
      palette = palette,
      domain = domain,
      na.color = "black"
    )

  }

  # build plot with legend
  plot <- gissr::leaflet_plot(
    st,
    fill_opacity = fill_opacity,
    colour = ~pal(domain),
    popup = popup,
    opacity = opacity
  )  %>%
    leaflet::addLegend(
      "bottomright",
      pal = pal,
      values = ~domain,
      title = colour_by,
      opacity = 1
    )


  return(plot)

}




