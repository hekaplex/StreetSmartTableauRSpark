# #############################################################################
# SparkR usage

# Note: To load SparkR into a Databricks notebook, run the following:

# library(SparkR)

# You can then remove "SparkR::" from the following function call.
# #############################################################################

# Use SparkR to read the airlines dataset from 2008.
airlinesDF <- SparkR::read.df(path        = "/databricks-datasets/asa/airlines/2008.csv",
                              source      = "csv",
                              inferSchema = "true",
                              header      = "true")

# Print the loaded dataset's class name.
cat("Class of SparkR object: ", class(airlinesDF), "\n")

# Output:
#
# Class of SparkR object: SparkDataFrame

# #############################################################################
# sparklyr usage

# Note: To install, load, and connect with sparklyr in a Databricks notebook,
# run the following:

# install.packages("sparklyr")
# library(sparklyr)
# sc <- sparklyr::spark_connect(method = "databricks")

# If you run "library(sparklyr)", you can then remove "sparklyr::" from the
# preceding "spark_connect" and from the following function call.
# #############################################################################

# Use sparklyr to read the airlines dataset from 2007.
airlines_sdf <- sparklyr::spark_read_csv(sc   = sc,
                                         name = "airlines",
                                         path = "/databricks-datasets/asa/airlines/2007.csv")

# Print the loaded dataset's class name.
cat("Class of sparklyr object: ", class(airlines_sdf))

# Output:
#
# Class of sparklyr object: tbl_spark tbl_sql tbl_lazy tbl
# Try to call a sparklyr function on a SparkR SparkDataFrame object. It will not work.
sparklyr::sdf_pivot(airlinesDF, DepDelay ~ UniqueCarrier)

# Output:
#
# Error : Unable to retrieve a Spark DataFrame from object of class SparkDataFrame

## Now try to call s Spark R function on a sparklyr tbl_spark object. It also will not work.
SparkR::arrange(airlines_sdf, "DepDelay")

# Output:
#
# Error in (function (classes, fdef, mtable) :
#   unable to find an inherited method for function ‘arrange’ for signature ‘"tbl_spark", "character"’
top10delaysDF <- SparkR::sql("SELECT
                               UniqueCarrier,
                               DepDelay,
                               Origin
                             FROM
                               airlines
                             WHERE
                               DepDelay NOT LIKE 'NA'
                             ORDER BY DepDelay
                             DESC LIMIT 10")

# Print the class name of the query result.
cat("Class of top10delaysDF: ", class(top10delaysDF), "\n\n")

# Show the query result.
cat("Top 10 airline delays for 2007:\n\n")
head(top10delaysDF, 10)

# Output:
#
# Class of top10delaysDF: SparkDataFrame
#
# Top 10 airline delays for 2007:
#
#   UniqueCarrier DepDelay Origin
# 1            AA      999    RNO
# 2            NW      999    EWR
# 3            AA      999    PHL
# 4            MQ      998    RST
# 5            9E      997    SWF
# 6            AA      996    DFW
# 7            NW      996    DEN
# 8            MQ      995    IND
# 9            MQ      994    SJT
# 10           AA      993    MSY
