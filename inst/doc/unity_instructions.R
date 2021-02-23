## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval = FALSE------------------------------------------------------------
#  library(terrainr)
#  library(sf)
#  library(magrittr)
#  
#  # This will get us data for a 16 km2 area centered on Mt. Marcy,
#  # in the Adirondack State Park of New York
#  raw_tiles <- data.frame(id = seq(1, 100, 1),
#                          lat = runif(100, 44.04905, 44.17609),
#                          lng = runif(100, -74.01188, -73.83493)) %>%
#    st_as_sf(coords = c("lng", "lat")) %>%
#    st_set_crs(4326) %>%
#    get_tiles(services = c("elevation", "ortho"))
#  
#  merged_outputs <- lapply(raw_tiles, merge_rasters)
#  
#  mapply(function(x, y) raster_to_raw_tiles(input_file = x,
#                                            output_prefix = "mt_marcy",
#                        # This is the maximum side length we can import to Unity
#                                            side_length = 4097,
#                                            raw = y),
#         merged_outputs,
#         c(TRUE, FALSE))

## ----echo=FALSE---------------------------------------------------------------
knitr::include_graphics("files.jpg")

## ----echo=FALSE---------------------------------------------------------------
knitr::include_graphics("new_unity.jpg")

## ----echo=FALSE---------------------------------------------------------------
knitr::include_graphics("new_scene.jpg")

## ----echo=FALSE---------------------------------------------------------------
knitr::include_graphics("heightmap_import.jpg")

## ----echo=FALSE---------------------------------------------------------------
knitr::include_graphics("tile_arrangement.jpg")

## ----echo=FALSE---------------------------------------------------------------
knitr::include_graphics("create_layer.jpg")

## ----echo=FALSE---------------------------------------------------------------
knitr::include_graphics("resize_layer.jpg")

## ----echo=FALSE---------------------------------------------------------------
knitr::include_graphics("finished.jpg")

## ----echo=FALSE---------------------------------------------------------------
knitr::include_graphics("finished_again.jpg")

