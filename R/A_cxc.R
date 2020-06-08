#' @title Technology Matrix in a commodity-by-commodity approach
#' @name A_cxc
#' 
#' @description Recebe duas matrizes U e V e retorna uma matriz tecnológica - A
#' 
#' @param U Use matrix.
#' @param V Make matrix.
#' @param U.commodity_industry If the Use Matrix is in the commodity_by_industry format =TRUE, else = FALSE
#' @param V.industry_commodity If the Make Matrix is in the Industry-by_commodity format = TRUE, else = FALSE
#' 
#' @details Use U.commodity_industry=TRUE if your Use Matrix is in a commodity-by-industry format 
#'          else use U.commodity_industry=FALSE. The same for V.industry_commodity - 
#'          use V.industry_commodity=TRUE if your Make Matrix is in a industry-by-commodity format, 
#'          else use V.industry_commodity=FALSE.
#'
#' @author Rodrigo Cerqueira
#'
#' @export
A_cxc <- function(U, V, U.commodity_industry=T, V.industry_commodity=T)
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
      A = B %*% D
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
      A =  B %*% t(D)
      #Inversa de Leontief
      Z = solve(round(V %*% solve(V)) - A)
    }
  }
  if (U.commodity_industry==F) {
    return("A matriz de recursos (V) deve estar no formato commodity_by_industry")
  }
  return(A)
}