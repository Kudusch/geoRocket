#' Interface with Rocket-API
#'
#' List all availables sources.
#'
#' @param filter Filter for a string.
#' @export
listSources <- function(filter = NA) {
    apiBase <- "http://172.23.1.218:5000/api/v1/"
    if (is.na(filter)) {
        j <- fromJSON(paste(readLines(paste(apiBase, "sources/", sep = ""), ok = T, warn = F), collapse=""))
        df <- j[c('name', 'title', 'keywords', 'homepage')]
    }
    return(df)
}

#' Interface with Rocket-API
#'
#' pigz needs to be installed for this function to work.
#'
#' @param id An object to save.
#' @export
downloadData <- function(id) {
    apiBase <- "http://172.23.1.218:5000/api/v1/"
    j <- fromJSON(paste(readLines(paste(apiBase, "sources/", sep = ""), ok = T, warn = F), collapse=""))
    df <- j[c('name', 'title', 'keywords', 'homepage')]
    n <- which(grepl(id, df$name))
    j$resources[[n]][["dpp:streamedFrom"]]
    return(FROM_GeoJson(j$resources[[n]][["dpp:streamedFrom"]][1]))
}
