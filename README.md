# Database Purification and Data Integration Pipeline 🧹🔗
This project demonstrates an ETL pipeline (Extract, Transform, Load) to clean and structure mixed data formats, combining data from structured sources (e.g., SQL) and unstructured sources (e.g., JSON, logs). The pipeline includes identifying and handling missing, duplicate, or inconsistent data to ensure data quality.

# Requirements 📥
Make sure you have the following libraries installed:

1. pandas 📂
2. sqlite3 (or any SQL database) 🗄️
3. json 📝
4. google.colab (for downloading files in Google Colab) 🌐
5. 
You can install the required libraries using pip if needed:
```bash
pip install pandas
```
Setup ⚙️
SQL Data: The project assumes that you have an SQL file (structured_data.sql) containing data creation and insertion queries. The SQL database is used to store structured data.

JSON Data: The unstructured data is in a JSON file (unstructured_data.json), which may contain log data or other textual information.

# Steps in the Pipeline 🔄

Step 1: Extract Data
Extract Data from SQL Database:
Connect to the SQLite database and load the structured data into a pandas DataFrame.
Drop any existing table if needed.
Read the SQL queries from a file and execute them to create and insert the data.
```bash
import sqlite3
import pandas as pd

conn = sqlite3.connect('structured_data.db')

# Drop the table if it exists
conn.execute('DROP TABLE IF EXISTS structured_data')

# Load and execute SQL queries
with open('structured_data.sql', 'r') as file:
    sql_queries = file.read()
conn.executescript(sql_queries)

# Load the data into a pandas DataFrame
df_sql = pd.read_sql('SELECT * FROM structured_data', conn)
Extract Data from JSON:
Load the unstructured JSON file into a pandas DataFrame using json_normalize.
import json

with open('/content/unstructured_data.json', 'r') as file:
    df_json = pd.json_normalize(json.load(file))
```
Step 2: Transform Data
Handling Missing Data:
Fill missing values in the structured data (df_sql) with the mean of the column (if applicable).
Extract date information from the log column of the unstructured data and convert it to a standard datetime format. Handle missing or invalid dates by filling them with a placeholder date.

# Handle missing data in structured data
```bash
df_sql['score'] = df_sql['score'].fillna(df_sql['score'].mean())
```
```bash
# Handle missing or invalid date data in unstructured data
df_json['log'] = df_json['log'].str.extract(r'(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2})')[0]
df_json['log'] = pd.to_datetime(df_json['log'], errors='coerce')
df_json['log'].fillna(pd.to_datetime('2025-01-01'), inplace=True)
```
Merging the Data:
Merge the structured (df_sql) and unstructured (df_json) data on common fields like user_id and log_id. You can use different types of joins (e.g., inner join, left join) depending on your requirements.

# Merge the two DataFrames on common fields
```bash
merged_df = pd.merge(df_sql, df_json, how='inner', left_on='user_id', right_on='log_id')
```
Step 3: Load Data
Once the data is merged and transformed, save it into a CSV file for further analysis or sharing.
# Save the merged DataFrame to a CSV file
```bash
merged_df.to_csv('merged_data.csv', index=False)
```
# Optionally, download the CSV file in Google Colab
```bash
from google.colab import files
files.download('merged_data.csv')
```

# Data Quality and Validation 🧑‍🔬
To ensure data quality and validation, the following steps are crucial:

# Handling Missing Data:

Impute missing values using suitable strategies such as filling with the mean, median, or placeholder values.
Use domain knowledge to decide on the best method of handling missing data.
Handling Duplicates:

Remove or flag duplicate records in both the structured and unstructured data sources to avoid skewing analysis.

# Consistency Checks:

Ensure that data from different sources (e.g., SQL and JSON) is aligned and standardized. For example, check if the user_id in SQL matches the log_id in JSON before merging.
# Data Validation:

Verify that the data follows the correct format, range, or business rules, especially for critical fields like dates, IDs, or numerical scores.
# Outlier Detection:

Identify and handle outliers in the data that might affect the model’s performance or data integrity.
# Running the Code ▶️
To run the code, ensure that you've set up the environment with the necessary libraries and dataset files. Then, execute the script to extract, transform, merge, and load the data. Finally, the merged dataset can be saved as a CSV file for further use.

This README provides an overview of the pipeline for cleaning and structuring mixed data formats from SQL and JSON sources, addressing key aspects like missing data, merging datasets, and ensuring data quality.
