#Setup of R<->Tableau
install.packages("Rserve")
library(Rserve)
Rserve()
#Setup of R<->Spark
install.packages("devtools")
install.packages("dplyr")
install.packages("Rtool")
devtools::install_github("sparklyr/sparklyr")
library(sparklyr)
library(dplyr)
library(DBI)
sc <- spark_connect(method = "databricks")
install.packages("sparklyr")
install.packages("SparkR")

library(SparkR, lib.loc = .libPaths(c(file.path('C:\\spark322_hadoop27\\spark-3.2.2-bin-hadoop2.7', 'R', 'lib'), .libPaths())))
Sys.setenv(SPARK_HOME = "<spark-home-path>")
# Point to the Databricks Connect PySpark installation, e.g., /path/to/.../pyspark
Sys.setenv(SPARK_HOME = "C:\\Users\\andre\\anaconda3\\envs\\streetsmarttableaurspark\\lib\\site-packages\\pyspark")
Sys.setenv(JAVA_HOME = "c:\\Users\\andre\\anaconda3\\envs\\streetsmarttableaurspark\\Library")
#R<->VS Code
install.packages("languageserver")
install.packages("radian")
install.packages("httpgd")
# Install from CRAN
install.packages("sparklyr")

# Or install the latest master version from GitHub
install.packages("devtools")
devtools::install_github("sparklyr/sparklyr")

#invokes
sparkR.session()

library(sparklyr)
sc <- spark_connect(method = "databricks", spark_home = "C:\\Users\\andre\\anaconda3\\envs\\streetsmarttableaurspark\\lib\\site-packages\\pyspark")

iris_tbl <- copy_to(sc, iris, overwrite = TRUE)

library(dplyr)
src_tbls(sc)

iris_tbl %>% count

df <- as.DataFrame(faithful)
head(df)

df1 <- dapply(df, function(x) { x }, schema(df))
collect(df1)

