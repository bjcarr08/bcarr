# build the package with Ctrl + Shift + B

#' Add Quotes & Comma Separator to Clipboard Items
#' Read a column of data from clipboard & writes new values back to clipboard with quotes and comma separators added
#'
#' @param lineBreak A True or False value. True tells the function to write new values 1 per line, False tells it to concatenate all values on 1 line. Default is True.
#' @param commentChar A character vector of length one containing a single character or an empty string. Use "" to turn off the interpretation of comments altogether. Default is "|". (see details for more)
#' @param singleQuotes A True or False value. True tells the function to write new values wrapped in single quotes, False will wrap values in double quotes. Default is True.
#' @details Parameter commentChar treats any string following "|" char in the copied data as a comment & the code will ignore it, prob won't ever need to change this value.
#' @export
readWriteClip_addQuoteComma <- function(lineBreak = T, commentChar = "|", singleQuotes = T, callMiner = F){
  x <- clipr::read_clip_tbl(header = F, stringsAsFactors = T, comment.char = commentChar)
  if(callMiner == T){
    xNew <-  dplyr::mutate(x, V1 = stringr::str_remove(x$V1, "lucid/robGrahamEnterprises/"))
    xNew <-  dplyr::mutate(xNew, V1 = stringr::str_remove(xNew$V1, ".mp3"))
    xNew$new <- paste0(xNew$V1, ";")
    xNew$new[nrow(xNew)] <-  stringr::str_remove(xNew$new[nrow(xNew)], ";")
    clipr::write_clip(xNew$new, breaks = "")
  } else {
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
}

### OLD (updated on 10-16-2024)
# readWriteClip_addQuoteComma <- function(lineBreak = T, commentChar = "|", singleQuotes = T, callMiner = F){
#   x <- clipr::read_clip_tbl(header = F, stringsAsFactors = T, comment.char = commentChar)
#   if(calMiner == T){
#     x$new <- paste0(x$V1, ";")
#   } else {
#       if(singleQuotes == T){
#         x$new <- paste0("'", x$V1, "'")
#       } else {
#         x$new <- paste0('"', x$V1, '"')
#       }
#       if(lineBreak == T){
#         clipr::write_clip(x$new, breaks = ",\n")
#       } else {
#         clipr::write_clip(x$new, breaks = ",")
#       }
#   }
# }

