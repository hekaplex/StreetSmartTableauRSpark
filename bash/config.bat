conda create --name streetsmartTableauRSpark python=3.8
pip install -U "databricks-connect==10.4.*"
conda activate streetsmartTableauRSpark
@REM https://adb-4002832894225232.12.azuredatabricks.net/?o=4002832894225232#setting/clusters/1105-063159-7j9yi5hs/configuration
@REM personal access token: ffffdapi764addac1cfb0498c99c860714c4b9e0-3
conda install -c anaconda openjdk
databricks-connect configure