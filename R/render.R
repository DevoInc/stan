render <- function(dataframe, dimensions, query) {

  colnames(dataframe) <- dimensions 

  # Alternative source of data for testing 
  #dataframe <-read.csv("/usr/local/lib/R/site-library/stan-opencpu/series1.txt", header = TRUE)

	# Render the markdwn
  rmarkdown::render("/usr/local/lib/opencpu/apps/ocpu_github_devoinc_stan/stan/stan.Rmd", output_file="output.html",
                    output_dir=getwd(),
                    intermediates_dir=getwd(), params=list(test=dataframe, query=query), output_format="html_document");
  invisible();
}
