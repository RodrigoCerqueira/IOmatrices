#' @title Total Requirements Matrix in a commodity-by-commodity approach
#' @name Z_ixi
#' 
#' @description Recebe duas matrizes U e V e retorna uma matriz invesa de Leontief - Z
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
Z_cxc <- function(U, V, x.commodity_industry=T, y.industry_commodity=T)
{
  if (x.commodity_industry==T) { 
    if (y.industry_commodity==T) {
      #estrutura de insumos
      B = U %*% solve(diag(rowSums(V)))
      #market-share
      D = V %*% solve(diag(colSums(V)))
      #
      C = t(V) %*% solve(diag(rowSums(V)))
      #matriz A
      A = B %*% D
      #Inversa de Leontief
      Z = solve(round(V %*% solve(V)) - A)
    }
    if (y.industry_commodity==F) {
      #estrutura de insumos
      B = U %*% solve(diag(colSums(V)))
      #market-share
      D = V %*% solve(diag(rowSums(V)))
      #
      C = V %*% solve(diag(colSums(V)))
      #matriz A
      A =  B %*% t(D)
      #Inversa de Leontief
      Z = solve(round(V %*% solve(V)) - A)
    }
  }
  if (x.commodity_industry==F) {
    return("A matriz de recursos (V) deve estar no formato commodity_by_industry")
  }
  return(Z)
}