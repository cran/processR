% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/modmedSummary.R
\name{medSummary}
\alias{medSummary}
\title{Summarize the mediation effects}
\usage{
medSummary(semfit, boot.ci.type = "perc", effects = c("indirect", "direct"))
}
\arguments{
\item{semfit}{An object of class lavaan}

\item{boot.ci.type}{Type of bootstrapping interval. Choices are c("norm","basic","perc",bca.simple","all")}

\item{effects}{Names of effects to be summarized}
}
\value{
A data.frame and an object of class medSummary
}
\description{
Summarize the mediation effects
}
\examples{
library(lavaan)
labels=list(X="cond",M="pmi",Y="reaction")
model=tripleEquation(labels=labels)
\donttest{
semfit=sem(model=model,data=pmi, se="boot", bootstrap=100)
medSummary(semfit)
medSummary(semfit,boot.ci.type="all")
}
}
