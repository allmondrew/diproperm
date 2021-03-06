% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DiProPerm.R
\name{DiProPerm}
\alias{DiProPerm}
\title{Conducts a DiProPerm test}
\usage{
DiProPerm(
  X,
  y,
  B = 1000,
  classifier = "dwd",
  univ.stat = "md",
  balance = TRUE,
  alpha = 0.05,
  cores = 2
)
}
\arguments{
\item{X}{An \code{nxp} data matrix.}

\item{y}{A vector of \code{n} binary class labels -1 and 1.}

\item{B}{The number of permutations for the DiProPerm test. The default is 1000.}

\item{classifier}{A string designating the binary linear classifier. classifier="dwd", distance weighted discrimination, is the default. classifier="dwd" implements a generalized DWD model from the \code{\link[DWDLargeR]{genDWD}} function in the \code{DWDLargeR} package.
The penalty parameter, \code{C}, in the \code{genDWD} function is calculated using the \code{\link[DWDLargeR]{penaltyParameter}} function in \code{DWDLargeR}. \code{DWDLargeR} has several parameters which have reasonable defaults, whose use is recommended. More details on the algorithm used to calculate the DWD solution can be found \href{https://www.tandfonline.com/doi/full/10.1080/10618600.2017.1366915}{here}.
One other option for the binary classifier is the "md", mean difference direction.}

\item{univ.stat}{A string indicating the univariate statistic used for the projection step. univ.stat="md", mean difference, is the default.}

\item{balance}{A logical indicator for whether a balanced permutation design should be implemented.  The default is TRUE.}

\item{alpha}{An integer indicating the level of significance. The default is 0.05.}

\item{cores}{An integer indicating the number of cores to be used for parallel processing. The default is 2. Note, parallel processing is only available on MacOS and Ubuntu operating systems at this time. Windows users will default to using 1 core.}
}
\value{
A list containing:
\item{\code{X}}{The observed \code{nxp} data matrix.}
\item{\code{y}}{The observed vector of \code{n} binary class labels -1 and 1.}
\item{\code{obs_teststat}}{The observed univariate test statistic.}
\item{\code{xw}}{Projection scores used to compute the specified univariate statistic.}
\item{\code{w}}{The loadings of the binary classification.}
\item{\code{Z}}{The \code{Z} score of the observed test statistic.}
\item{\code{cutoff_value}}{The cutoff value to achieve an alpha level of significance.}
\item{\code{pvalue}}{The pvalue from the permutation test.}
\item{\code{perm_dist}}{A list containing the permuted projection scores and permuted class labels for each permutation.}
\item{\code{perm_stats}}{A \code{B} dimensional vector of univariate test statistics.}
}
\description{
This package conducts a Direction-Projection-Permutation (DiProPerm) test.
For more details see Wei et al, 2016 \href{https://www.tandfonline.com/doi/full/10.1080/10618600.2015.1027773}{here}.
DiProPerm is a two-sample hypothesis test for high-dimensional data and tests the difference of two high-dimensional distributions induced by a binary linear classifier.
}
\examples{
\donttest{data(mushrooms)
X <- Matrix::t(mushrooms$X)
y <- mushrooms$y
dpp <- DiProPerm(X=X,y=y,B=10)}
\dontshow{data(mushrooms)
X.temp <- SparseM::as.matrix(mushrooms$X)[,1:50]
X <- Matrix::t(X.temp)
y <- mushrooms$y[1:50]
dpp <- DiProPerm(X=X,y=y,B=100,classifier="md")}

}
\references{
{Lam, X. Y., Marron, J. S., Sun, D., & Toh, K.-C. (2018). Fast Algorithms for
 Large-Scale Generalized Distance Weighted Discrimination. Journal of
 Computational and Graphical Statistics, 27(2), 368–379.
 \url{https://doi.org/10.1080/10618600.2017.1366915}}

{Wei, S., Lee, C., Wichers, L., & Marron, J. S. (2016). Direction-Projection-Permutation for High-Dimensional Hypothesis Tests. Journal of Computational and Graphical Statistics, 25(2), 549–569. \url{https://doi.org/10.1080/10618600.2015.1027773}}
}
\author{
Andrew G. Allmon, J.S. Marron, Michael G. Hudgens
}
