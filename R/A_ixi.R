#' @title Technology Matrix in a industry-by-industry approach
#' @name A_ixi
#' 
#' @description Recebe duas matrizes U e V e retorna uma matriz tecnológica - A
#' 
#' @param U Use matrix.
#' @param V Make matrix.
#' 
#' @details Use U.commodity_industry=TRUE if your Use Matrix is in a commodity-by-industry format 
#'          else use U.commodity_industry=FALSE. The same for V.industry_commodity - 
#'          use V.industry_commodity=TRUE if your Make Matrix is in a industry-by-commodity format, 
#'          else use V.industry_commodity=FALSE.
#'
#' @author Rodrigo Cerqueira
#'
#' @export
A_ixi <- function(U, V, U.commodity_industry=T, V.industry_commodity=T)
{
  if (U.commodity_industry==T) { 
    if (V.industry_commodity==T) {
      #estrutura de insumos
      B = U %*% solve(diag(rowSums(V)))
      #market-share
      D = V %*% solve(diag(colSums(V)))
      #
      C = t(V) %*% solve(diag(rowSums(V)))
      #matriz A
      A = D %*% B
      #Inversa de Leontief
      Z = solve(round(V %*% solve(V)) - A)
    }
    if (V.industry_commodity==F) {
      #estrutura de insumos
      B = U %*% solve(diag(colSums(V)))
      #market-share
      D = V %*% solve(diag(rowSums(V)))
      #
      C = V %*% solve(diag(colSums(V)))
      #matriz A
      A = t(D) %*% B
      #Inversa de Leontief
      Z = solve(round(V %*% solve(V)) - A)
    }
  }
  if (U.commodity_industry==F) {
    return("The Use matrix must be in commodity_by_industry format")
  }
  return(A)
}
