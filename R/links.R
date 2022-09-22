#' Get official links from book
#'
#' Use this function in the book so that all links are updated in a single location.
#'
#' @return A list with links
#' @export
#'
#' @examples
#'
#' print(links_get())
links_get <- function() {

  my_l <- list(book_blog_site = 'https://www.msperlin.com/blog/publication/XXXX',
               book_blog_classtools  = 'https://www.msperlin.com/classtools',
               book_amazon_ebook = "TBD",
               book_amazon_print = "TBD",
               book_amazon_hardcover = "TBD",
               book_github_classtools = 'https://github.com/msperlin/classtools',
               book_github_source = 'TBD',
               blog_site = 'https://www.msperlin.com/blog',
               adfer_web = "https://www.msperlin.com/adfeR")

  return(my_l)

}
