clustering <- function(dataframe, dimensions) {

  colnames(dataframe) <- dimensions 

  # Alternative source of data for testing
  #dataframe <-read.csv("/usr/local/lib/R/site-library/stan-opencpu/series1.txt", header = TRUE)

	# Render the markdwn
  rmarkdown::render("/usr/local/lib/opencpu/site-library/stanopencpu/estimatingK.Rmd", output_file="output.html",
                    output_dir=getwd(),
                    intermediates_dir=getwd(), params=list(df=dataframe), output_format="html_document");
  invisible();
}
