# build the package with Ctrl + Shift + B


#' Add Double Quotes & Comma Separator
#'
#' Read a column of data from clipboard & writes with added double quotes and comma separator
#'
#' @param comment.char A character vector of length one containing a single character or an empty string. Use "" to turn off the interpretation of comments altogether.
#' @export
readWriteClip_addQuoteComma <- function(lineBreak = T, comment.char = "|", singleQuotes = T){
  x <- clipr::read_clip_tbl(header = F, stringsAsFactors = T, comment.char = comment.char)
  if(singleQuotes == T){
    x$new <- paste0("'", x$V1, "'")
  } else {
    x$new <- paste0('"', x$V1, '"')
  }
  if(lineBreak == T){
    clipr::write_clip(x$new, breaks = ",\n")
  } else {
    clipr::write_clip(x$new, breaks = ",")
  }
}
