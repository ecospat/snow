#Snow cover duration mapping in R and Google Earth Engine

Code and data associated with the paper "Testing the power of remotely sensed snow cover duration to predict plant species distributions in alpine ecosystems" by Thomas Panchard, Olivier Broennimann, Mathieu Gravey, Grégoire Mariethoz and Antoine Guisan.

This page provides the code used to create mean snowmelt date maps used as predictors in the species distributions models.

###Google Earth Engine (GEE) approach

This approach directly produces an mean snowmelt date map in a procedure fully embedded inside GEE. [Here](https://code.earthengine.google.com/3db9650ee5a8e3c14641810ade2cc6a2?noload=true) is a direct link to the script inside GEE and full code is available [here](http://https://github.com/ecospat/ecospat/snow/code_SCDgee_map.txt).

###Custom R approach

This approach first downloads the normalised difference snow index (NDSI) images from GEE as tiff files. [Here](https://code.earthengine.google.com/cdf57b697608c682b4c16820cbb0aaf2?noload=true) is a direct link to the extraction script inside GEE and full code is available [here](http://https://github.com/ecospat/ecospat/snow/code_extraction_NDSI.txt).

The final mean snowmelt date map is produced by [this code](http://https://github.com/ecospat/ecospat/snow/SCD_code_R.R).


Those remote sensing analyses are based on the work of Macander, M. J., Swingley, C. S., Joly, K., & Raynolds, M. K. (2015). Landsat-based snow persistence map for northwest Alaska. Remote Sensing of Environment, 163, 23‑31. [https://doi.org/10.1016/j.rse.2015.02.028](https://doi.org/10.1016/j.rse.2015.02.028).

###Data
[Plant data](http://https://github.com/ecospat/ecospat/snow/Final_Coord_30Occ.txt) used for the species distribution models.

[Meteo stations data](http://https://github.com/ecospat/ecospat/snow/meteostations/order_108597_data.txt) used to validate the mean snowmelt date maps.

