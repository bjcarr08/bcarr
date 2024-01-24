# build the package with Ctrl + Shift + B


#' Add Double Quotes & Comma Separator
#'
#' Read a column of data from clipboard & writes with added double quotes and comma separator
#' @param comment.char A character vector of length one containing a single character or an empty string. Use "" to turn off the interpretation of comments altogether.
#' @export
readWriteClip_addQuoteComma <- function(comment.char = "|"){
  x <- clipr::read_clip_tbl(header = F, stringsAsFactors = T, comment.char = comment.char)
  x$new <- paste0('"', x$V1, '"')
  clipr::write_clip(x$new, breaks = ",")
}
