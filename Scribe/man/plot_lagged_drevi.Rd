% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotting.R
\name{plot_lagged_drevi}
\alias{plot_lagged_drevi}
\title{Plot the lagged DREVI plot pairs of genes across pseudotime.}
\usage{
plot_lagged_drevi(cds_subset, gene_pairs_mat, log = TRUE, d = 1,
  grid_num = 25, n_row = NULL, n_col = 1, scales = "free",
  verbose = FALSE)
}
\arguments{
\item{cds_subset}{CellDataSet for the experiment}

\item{gene_pairs_mat}{A matrix where each row is the gene pair and the first column is the hypothetical source or regulator while the second column represents the hypothetical target. The name in this matrix should match the name in the gene_short_name column of the cds_subset object.}

\item{log}{A logic argument used to determine whether or not you should perform log transformation (using log(expression + 1)) before calculating density estimates, default to be TRUE.}

\item{d}{The time delay between the source and target gene.}

\item{grid_num}{The number of grid when creating the lagged DREVI plot.}

\item{n_row}{number of columns used to layout the faceted cluster panels}

\item{n_col}{number of columns used to layout the faceted cluster panels}

\item{scales}{The character string passed to facet function, determines whether or not the scale is fixed or free in different dimensions.}

\item{verbose}{A logic argument to determine whether or not we should print the detailed running information.}
}
\value{
a ggplot2 plot object
}
\description{
This plotting function builds on the original idea of DREVI plot but is extended in the context for causal network.  
It considers the time delay between the hypothetical regulators to the target genes which is parametered by `d`. 
Lagged DREVI plot first estimate the joint density (P(x_{t - d}, y_t)) for variables x_{t - d} and y_t, then it divides the joint density by the 
marginal density P(x_{t - d}) to get the conditional density estimate (P(x_{t - d}, y_t | x_{x - d})). 
We then calculate the z-score normalizing each column of conditional density. Note that this plot tries to demonstrate the potential influence
between two variables instead of the factual influence. A red line corresponding to the point with maximal density on each x value is plot which 
indicates the maximal possible point for y_t give the value of x_{t - d}. The 2-d density is estimated through the kde2d function from MASS package.
}
\examples{
\dontrun{
lung <- load_lung() 
gene_pairs_mat <- matrix(c('H19', 'Ccnd2', 'Ccnd2', 'Scnn1g'), ncol = 2)
plot_lagged_drevi(lung, gene_pairs_mat)
}
}
\references{
Krishnaswamy, Smita, et al. "Conditional density-based analysis of T cell signaling in single-cell data." Science 346.6213 (2014): 1250689.
}
