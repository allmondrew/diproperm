% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{mushrooms}
\alias{mushrooms}
\title{Classification data from Audobon Society Field Guide (1981)}
\format{
A list (\code{X}) containing a 112x8124 matrix of 8124 mushrooms with 112
features; and an outcome vector (\code{y}) of length 8124 containing the class information (-1 = "edible", 1="poisonous/unknown").
The 112 features are
0/1 dummy variables for 22 different categorical attributes. All 22 attributes and their
categories are clearly displayed at the source link below.
}
\source{
This data can be found at the UCI Machine Learning Data Repository
website. \url{https://archive.ics.uci.edu/ml/datasets/Mushroom}
}
\usage{
mushrooms
}
\description{
This data set includes descriptions of hypothetical samples corresponding to
23 species of gilled mushrooms in the Agaricus and Lepiota family. Each
species is identified as definitely edible, definitely
poisonous, or of unknown edibility and not recommended. The unknown class was
combined with the poisonous class such that there were two classes: definitely
edible and poisonous/unknown.
}
\references{
{Dua, D. and Graff, C. (2019). UCI Machine Learning Repository
[http://archive.ics.uci.edu/ml]. Irvine, CA: University of California,
School of Information and Computer Science.}

{Lincoff, G. (1981). The Audubon Society field guide to North American mushrooms. New York: Knopf: Distributed by Random House, c1981.}
}
\keyword{datasets}
