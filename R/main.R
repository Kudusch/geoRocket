#' Interface with Rocket-API
#'
#' List all availables sources.
#'
#' @param filter Filter for a string.
#' @export
listSources <- function(filter = NA, view = TRUE) {
    apiBase <- "http://172.23.1.218:5000/api/v1/"
    if (is.na(filter)) {
        j <- fromJSON(paste(readLines(paste(apiBase, "sources/", sep = ""), ok = T, warn = F), collapse=""))
        df <- j[c('name', 'title', 'keywords', 'homepage')]
    }
    if (view == TRUE) {
        View(df)
    } else {
        return(df)
    }
}

#' Interface with Rocket-API
#'
#' Download geojson data from Rocket-API server.
#'
#' @param id Name of the data source.
#' @export
downloadData <- function(id) {
    apiBase <- "http://172.23.1.218:5000/api/v1/"
    j <- fromJSON(paste(readLines(paste(apiBase, "sources/", sep = ""), ok = T, warn = F), collapse=""))
    df <- j[c('name', 'title', 'keywords', 'homepage')]
    n <- which(grepl(id, df$name))
    url <- j[n,]$resources[[1]][["dpp:streamedFrom"]]
    name <- j[n,]$resources[[1]][["name"]]
    u <- menu(name, title="Choose resource for download:")
    return(geojsonio::geojson_read(url[u], what = "sp"))
}
