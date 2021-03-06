#' Returns the loadings of the binary linear classifier (e.g. DWD)
#'
#' @name loadings
#'
#' @description Returns the variable indexes who had the highest loadings in the binary classification.  Higher loading values indicate a variable's contribution toward the separation between the two classes. The loadings vector is a unit vector, thus the sum of its squares must be equal to one and range from -1 to 1.  Also, the loadings direction vector points from the negative to positive class. Thus, positive entries correspond to variables that are larger for the positive class.
#'
#' @param dpp A DiProPerm list.
#' @param loadnum An integer indicating the number of variables to display.  For example, if loadnum=5 then the indexes for the five variables who contributed most toward the separation of the two classes are displayed. The default is to print out all the loadings.
#'
#' @return Returns the indexes and loadings for variables which contributed the most toward the separation of the the binary classifier.
#'
#' @export
#'
#' @author Andrew G. Allmon, J.S. Marron, Michael G. Hudgens
#' @examples
#' \donttest{data(mushrooms)
#' X <- Matrix::t(mushrooms$X)
#' y <- mushrooms$y
#' dpp <- DiProPerm(X=X,y=y,B=10)
#' loadings(dpp,loadnum=3)}
#' \dontshow{data(mushrooms)
#' X.temp <- SparseM::as.matrix(mushrooms$X)[,1:50]
#' X <- Matrix::t(X.temp)
#' y <- mushrooms$y[1:50]
#' dpp <- DiProPerm(X=X,y=y,B=100,classifier="md")
#' loadings(dpp,loadnum=3)}

loadings <- function(dpp,loadnum=length(dpp$w)) {
  dl <- data.frame(index=seq(1:ncol(dpp$X)),sorted_loadings=dpp$w,absload=abs(dpp$w))
  dll <- dplyr::arrange(dl, dplyr::desc(dl$absload))
  return(dll[1:loadnum,-3])
}

