## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval = FALSE------------------------------------------------------------
#  zion <- tmaptools::geocode_OSM("Zion National Park")$coords

## ---- eval = FALSE------------------------------------------------------------
#  library(terrainr)
#  library(sf)
#  library(magrittr)
#  
#  zion <- data.frame(x = zion[["x"]], y = zion[["y"]]) %>%
#    st_as_sf(coords = c("x", "y"), crs = 4326) %>%
#    set_bbox_side_length(8000)

## ---- eval = FALSE------------------------------------------------------------
#  merged_tiles <- zion %>%
#    get_tiles(services = c("elevation", "ortho")) %>%
#    lapply(merge_rasters)

## ---- eval = FALSE------------------------------------------------------------
#  make_manifest(merged_tiles$elevation,
#                merged_tiles$ortho)

## ---- echo = FALSE------------------------------------------------------------
knitr::include_graphics("generated_files.png")

## ---- echo = FALSE------------------------------------------------------------
knitr::include_graphics("new_unity.jpg")

## ---- echo = FALSE------------------------------------------------------------
knitr::include_graphics("manifest_import.png")

## ---- echo = FALSE------------------------------------------------------------
knitr::include_graphics("ominous.png")

## ---- echo = FALSE------------------------------------------------------------
knitr::include_graphics("terrain_surface.jpg")

