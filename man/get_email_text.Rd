% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{get_email_text}
\alias{get_email_text}
\title{Writes email message}
\usage{
get_email_text(class_name, exerc_name, n_q, my_deadline)
}
\arguments{
\item{class_name}{name of class}

\item{exerc_name}{name of exercise}

\item{n_q}{number of questions in exam}

\item{my_deadline}{deadline time}
}
\value{
a text on screen
}
\description{
Writes email message
}
\examples{
get_email_text("CLASSNAME", "EXERCICIO 01", 10, Sys.Date())
}
