# geoRocket

This R package connects to an API endpoint that serves datahub.io json describing available datasets.

With `listSources()` all available datasets are listed and `downloadData(id)` will list and download available resources from a dataset and return an R S3 object.
