## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(terrainr)

## -----------------------------------------------------------------------------
mt_elbert_points <- data.frame(
  lat = runif(100, min = 39.11144, max = 39.12416),
  lng = runif(100, min = -106.4534, max = -106.437)
)

## -----------------------------------------------------------------------------
mt_elbert_points <- sf::st_as_sf(mt_elbert_points,
                                 coords = c("lng", "lat"))
mt_elbert_points <- sf::st_set_crs(mt_elbert_points, 4326)

## ----eval = FALSE-------------------------------------------------------------
#  library(progressr)
#  handlers("progress")
#  with_progress(
#    output_files <- get_tiles(mt_elbert_points,
#                              output_prefix = tempfile(),
#                              services = c("elevation", "ortho"))
#    )

## ----eval = FALSE-------------------------------------------------------------
#  output_files

## ----echo = FALSE-------------------------------------------------------------
output_files <- list(
  elevation = "/tmp/RtmphTFQvZ/file65e5d859e628_3DEPElevation_1_1.tif",
  ortho = "/tmp/RtmphTFQvZ/file65e5d859e628_USGSNAIPPlus_1_1.tif"
)
output_files

## ----eval=FALSE---------------------------------------------------------------
#  raster::plot(raster::raster(output_files[[1]]))

## ----echo = FALSE-------------------------------------------------------------
knitr::include_graphics("example_dem.jpg")

## ----eval=FALSE---------------------------------------------------------------
#  raster::plotRGB(raster::brick(output_files[[2]]), scale = 1)

## ----echo = FALSE-------------------------------------------------------------
knitr::include_graphics("example_ortho.jpg")

## ----eval=FALSE---------------------------------------------------------------
#  library(ggplot2)
#  
#  elevation_raster <- raster::raster(output_files[[1]])
#  elevation_df <- as.data.frame(elevation_raster, xy = TRUE)
#  elevation_df <- setNames(elevation_df, c("x", "y", "elevation"))
#  
#  ggplot() +
#    geom_raster(data = elevation_df, aes(x = x, y = y, fill = elevation)) +
#    scale_fill_distiller(palette = "BrBG") +
#    coord_sf(crs = 4326)

## ----echo = FALSE-------------------------------------------------------------
knitr::include_graphics("elevation_ggplot.jpg")

## ----eval = FALSE-------------------------------------------------------------
#  ortho_raster <- raster::stack(output_files[[2]])
#  ortho_df <- as.data.frame(ortho_raster, xy = TRUE)
#  ortho_df <- setNames(ortho_df, c("x", "y", "red", "green", "blue", "alpha"))
#  
#  ggplot() +
#    geom_spatial_rgb(data = ortho_df,
#                     # Required aesthetics r/g/b specify color bands:
#                     aes(x = x, y = y, r = red, g = green, b = blue)) +
#    coord_sf(crs = 4326)

## -----------------------------------------------------------------------------
knitr::include_graphics("ortho_ggplot.jpg")

## ----eval = FALSE-------------------------------------------------------------
#  ggplot() +
#    geom_spatial_rgb(data = ortho_raster,
#                     aes(x = x, y = y, r = red, g = green, b = blue)) +
#    coord_sf(crs = 4326)

## ----echo = FALSE-------------------------------------------------------------
knitr::include_graphics("ortho_ggplot.jpg")

## ----eval = FALSE-------------------------------------------------------------
#  ggplot() +
#    geom_spatial_rgb(data = output_files[[2]],
#                     aes(x = x, y = y, r = red, g = green, b = blue)) +
#    coord_sf(crs = 4326)

## ----echo = FALSE-------------------------------------------------------------
knitr::include_graphics("ortho_ggplot.jpg")

## ----eval = FALSE-------------------------------------------------------------
#  ggplot() +
#    geom_spatial_rgb(data = output_files[[2]],
#                     aes(x = x, y = y, r = red, g = green, b = blue)) +
#    geom_sf(data = mt_elbert_points)

## ----echo = FALSE-------------------------------------------------------------
knitr::include_graphics("with_points.jpg")

## ---- eval = FALSE------------------------------------------------------------
#  mt_elbert_overlay <- vector_to_overlay(mt_elbert_points,
#                                         output_files[[2]],
#                                         size = 15,
#                                         color = "red")
#  knitr::include_graphics(mt_elbert_overlay)

## ---- echo = FALSE------------------------------------------------------------
knitr::include_graphics("mt_elbert_overlay.jpg")

## ---- eval=FALSE--------------------------------------------------------------
#  ortho_with_points <- combine_overlays(
#    # Overlays are stacked in order, with the first file specified on the bottom
#    output_files[[2]],
#    mt_elbert_overlay,
#    output_file = tempfile(fileext = ".png")
#    )
#  knitr::include_graphics(ortho_with_points)

## ---- echo = FALSE------------------------------------------------------------
knitr::include_graphics("combined_overlay.jpg")

## ----eval = FALSE-------------------------------------------------------------
#  georef_overlay <- georeference_overlay(
#    ortho_with_points,
#    output_files[[2]]
#  )

## ---- eval = FALSE------------------------------------------------------------
#  tile_overlays <- lapply(output_files[[2]],
#                          function(x) vector_to_overlay(mt_elbert_points,
#                                                        x,
#                                                        size = 15,
#                                                        color = "red",
#                                                        na.rm = TRUE))
#  
#  combined_tiles <- mapply(function(x, y) {
#    combine_overlays(x, y, output_file = tempfile(fileext = ".png"))
#    },
#    output_files[[2]],
#    tile_overlays)
#  
#  georef_tiles <- mapply(georeference_overlay, combined_tiles, output_files[[2]])
#  
#  merged_tiles <- merge_rasters(georef_tiles)

## ----eval = FALSE-------------------------------------------------------------
#  elevation_tile <- output_files[[1]]
#  make_manifest(elevation_tile, georef_tiles)

## ----echo = FALSE-------------------------------------------------------------
knitr::include_graphics("ebert_unity.jpg")

