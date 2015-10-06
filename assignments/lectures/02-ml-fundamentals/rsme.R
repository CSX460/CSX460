#' Calculate the RMSE and MAE
#'
#' @param y numeric; the observed value
#' @param yhat numeric; the estimated value
#'
#' @details
#'
#' @examples
#'
#'   y=1:10
#'   yhat=1:10+rnorm(10)
#'
#'   rmse( y, yhat )
#'   mae( 1:10, 1:10+rnorm(10) )
#'
#' @export

rmse <- function(y,yhat)
  (y-yhat)^2 %>% mean %>% sqrt


#' @export
mae <- function(y,yhat)
  (y-yhat) %>% abs %>% mean


