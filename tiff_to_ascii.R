#This is code for converting tiff file into ascii files.
# Load required libraries
library(tiff)
library(raster)

# Specify the path to your TIFF file
tiff_file <- "C:/Users/iamka/OneDrive/Documents/DICAM/Catania/02DEM/lidar_cata.DTM_25833_cata2drain.tif"

# Read the TIFF file
tif_data <- readTIFF(tiff_file)



# Read the TIFF file using raster::raster
raster_data <- raster(tiff_file)

# Get values from the raster
raster_values <- getValues(raster_data)

# Combine coordinates and values
ascii_data <- cbind(coordinates(raster_data), raster_values)


# Specify the output ASCII file with a .asc extension
output_file <- "dem.asc"



# Save ASCII data to a text file with .asc extension
write.table(ascii_data, output_file, col.names = FALSE, row.names = FALSE, quote = FALSE)
