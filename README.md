# Exploratory-Data-Analysis-EDA-of-Sql
In this we learn how to explore the data and analysis data through several ways and enhance our knowledge and skill

#Project Overview
This project demonstrates how Exploratory Data Analysis (EDA) can be effectively performed using pure SQL within MySQL Workbench.
The goal is to explore, summarize, and understand the structure and key insights of the dataset using SQL queries only — without any external programming libraries.

🛠️ Tools Used
MySQL Workbench

SQL (Structured Query Language)

📁 Dataset Description
The dataset used in this project is [world layoffs]. It contains information such as:

column_1 — company database 

column_2 — total laid off from the company

column_3 —  describe which country have more laid off according to the year

 

 
# Key SQL Operations Performed
Here are the EDA tasks I performed using pure SQL queries:

1. 📦 Basic Data Profiling
Checked table structure using:

sql
Copy
Edit
DESCRIBE your_table_name;
Counted total rows:

sql
Copy
Edit
SELECT COUNT(*) FROM your_table_name;
2. 🧾 Summary Statistics
Found min, max, avg, and sum for numeric columns:

sql
Copy
Edit
SELECT 
  MIN(column), 
  MAX(column), 
  AVG(column), 
  SUM(column) 
FROM your_table_name;
3. 📊 Distribution of Categorical Columns
Used GROUP BY with COUNT() to analyze frequency:

sql
Copy
Edit
SELECT category_column, COUNT(*) 
FROM your_table_name 
GROUP BY category_column 
ORDER BY COUNT(*) DESC;
4. 📉 Null & Missing Value Detection
Counted NULLs in each column:

sql
Copy
Edit
SELECT 
  SUM(CASE WHEN column IS NULL THEN 1 ELSE 0 END) AS null_count 
FROM your_table_name;
5. 📌 Duplicates Check
Found duplicates based on selected columns:

sql
Copy
Edit
SELECT column1, column2, COUNT(*) 
FROM your_table_name 
GROUP BY column1, column2 
HAVING COUNT(*) > 1;
6. 🧹 Outlier Detection (Simple Methods)
Found unusually high or low values using:

sql
Copy
Edit
SELECT * 
FROM your_table_name 
WHERE column > some_threshold OR column < some_threshold;
7. 🔗 Relationships Between Columns
Used aggregates with GROUP BY for comparison:

sql
Copy
Edit
SELECT category_column, AVG(numeric_column) 
FROM your_table_name 
GROUP BY category_column;
✅ Outcome
Gained full understanding of the data structure

Identified trends and patterns across multiple fields

Detected missing values and potential duplicates

Prepared the dataset for further analysis or reporting

📚 Learnings
How to perform EDA using only SQL queries

SQL techniques for summarizing and profiling data

Writing efficient and meaningful SQL queries

Using MySQL Workbench for real-world data analysis

📬 Contact
Name: [Ariz Iqbal ]
GitHub: [[your-github-url](https://github.com/Aiiqbal1881)]
LinkedIn: [Ariz Iqbal  ]

