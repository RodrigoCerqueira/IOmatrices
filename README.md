# IOmatrices
This package provides a set of tools to calculate input-output matrices from a commodity–industry accounting system. This functions follows the Miller and Blair's approach (Miller, Ronald E., and Peter D. Blair. Input-output analysis: foundations and extensions. Cambridge university press, 2009) in accordance with the System of National Accounts (SNA). 

Two approaches are included, using the Use and Make matrices: 1) The Commodity-Demand Driven Model (using "Industry-Based" Technology or "Commodity-Base" Technology), and 2) Industry-Demand Driven Model (using "Industry-Based" Technology or "Commodity-Base" Technology). The Technology (A) and Total Requirement (Z) Matrices obtained by these functions can be Commodity-by-Commodity or Industry-by-Industry. For more information on the calculation methodology, see Miller and Blair's Chapter 5 (2009).

## Getting Started
The first steps are to obtain the Uses and Make matrices of the country or region for which the input-product analyzes will be realized

Here are some links that can help you find the necessary files:
* [BEA](https://www.bea.gov/industry/input-output-accounts-data) - Bureau of Economic Analysis (BEA) / data from USA.
* [IBGE](https://www.ibge.gov.br/estatisticas/economicas/contas-nacionais/9052-sistema-de-contas-nacionais-brasil.html?=&t=resultados) - Brazilian Institute of Geography and Statistics (IBGE) / data from Brazil.
* [Eurostat](https://ec.europa.eu/eurostat/web/esa-supply-use-input-tables/data/database) - Statistical office of the European Union / data from Europe.
* [OECD](https://www.oecd.org/sdd/na/supply-and-use-tables-database.htm) - Organisation for Economic Co-operation and Development (OECD) / data from a bunch of Countries.

### Installation

Install the **devtools** package. If you already have installed devtools package ignore this step
```
install.packages("devtools")
```
The **devtools** package provides ```install_github()``` that enables installing packages from GitHub.
```
library(devtools)
install_github("RodrigoCerqueira/IOmatrices")
```

### Usage
All **IOmatrices** functions uses 4 arguments: ```U```, ```V```, ```U.commodity_industry``` and ```V.industry_commodity```
 
```U``` and ```V``` arguments are respectively the corresponding object from Uses and Make matrices.

```U.commodity_industry``` and ```V.industry_commodity``` are logical arguments corresponding to the format of Use and Make matrices. if the Use Matrix is in the commodity_by_industry format ```U.commodity_industry=TRUE```, else ```U.commodity_industry=FALSE```. If the Make Matrix is in the Industry-by_commodity format ```V.industry_commodity=TRUE```, ```V.industry_commodity=FALSE```.

The currently functions available in the version 1.0.0 are: 
* ```A_cxc()``` - Calculates the Technological Matrix in a **commodity-by-commodity** approach
* ```A_ixi()``` - Calculates the Technological Matrix in a **industry-by-industry** approach
* ```Z_cxc()``` - Calculates the Total Requirements (Leontief inverse) Matrix in a **commodity-by-commodity** approach
* ```Z_ixi()``` - Calculates the Total Requirements (Leontief inverse) Matrix in a **industry-by-industry** approach

#### Example

```
library(devtools)
install_github("RodrigoCerqueira/IOmatrices")
library(IOmatrices)

#creating a hypothetical Use and Make Matrices (from Miller and Blair's Chapter 5 (2009)) 
Use_Matrix <- matrix(c(12,10,8,7), nrow = 2, byrow = F)
Make_Matrix <- Make <- matrix(c(90,10,0,100), nrow = 2, byrow = F)

#calculating the Technological Matrix industry-by-industry
A_Matrix <- A_ixi(Use_Matrix, Make_Matrix, TRUE, TRUE)

#calculating the Total Requirements (Leontief inverse) Matrix industry-by-industry
Z_Matrix <- Z_ixi(Use_Matrix, Make_Matrix, TRUE, TRUE)
```
