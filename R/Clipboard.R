# build the package with Ctrl + Shift + B


#' Add Double Quotes & Comma Separator
#'
#' Read a column of data from clipboard & writes with added double quotes and comma separator
#' @param comment.char A character vector of length one containing a single character or an empty string. Use "" to turn off the interpretation of comments altogether.
#' @examples
#' # example code
#'
#' # SKIP THIS STEP (your input data should be saved to your clipboard before running the next line)
#' clipr::write_clip(c("test1","test2","test3"))
#'
#' # This will not output anything to your console, the new data is saved to your clipboard
#' readWriteClip_addQuoteComma()
#'
#' # Paste in anyprogram you like, here is a view of the new data saved to clipboard
#' # "test1","test2","test3"
#'
#' @export
readWriteClip_addQuoteComma <- function(comment.char = "|"){
  x <- clipr::read_clip_tbl(header = F, stringsAsFactors = T, comment.char = comment.char)
  x$new <- paste0('"', x$V1, '"')
  clipr::write_clip(x$new, breaks = ",")
}
