# build the package with Ctrl + Shift + B


#' Add Double Quotes & Comma Separator
#'
#' Read a column of data from clipboard & writes with added double quotes and comma separator
#'
#' @details
#' SKIP THIS STEP (your input data should be saved to your clipboard before running the next line)
#' The function will not output anything to the console
#' The new data is saved to your clipboard
#' Paste contents of clipboard in any program you like
#' Here is a view of the new data that was saved to clipboard in the above example
#'
#' @examples
#' clipr::write_clip(c("test1","test2","test3"), allow_non_interactive = T)
#' readWriteClip_addQuoteComma()
#' # "test1","test2","test3"
#'
#' @param comment.char A character vector of length one containing a single character or an empty string. Use "" to turn off the interpretation of comments altogether.
#' @export
readWriteClip_addQuoteComma <- function(comment.char = "|"){
  x <- clipr::read_clip_tbl(header = F, stringsAsFactors = T, comment.char = comment.char)
  x$new <- paste0('"', x$V1, '"')
  clipr::write_clip(x$new, breaks = ",")
}
