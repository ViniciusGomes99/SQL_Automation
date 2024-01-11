# Data Engineering, Analysis and Automation 

## Overview
This document outlines the data engineering and analysis processes for the `acadiatest2` database. It includes SQL scripts for creating and structuring the database, as well as queries for analyzing the data.

## Table of Contents
1. Database Creation
2. Data Engineering
3. Data Analysis
4. Conclusion

## 1) Database Creation
The database `acadiatest2` is created to store and manage the data efficiently. The SQL script for this phase includes:
sql
CREATE DATABASE acadiatest2
USE acadiatest2

## 2) Data Engineering
The data engineering phase involves creating tables to store different types of data and establishing relationships between them. The tables include `cSegments`, `cProfiles`, `cDepartments`, and `fHistory`.

### Creating Tables
- **cSegments**: Stores segment details.
- **cProfiles**: Contains profile information.
- **cDepartments**: Holds department data.
- **fHistory**: Keeps track of sales history and customer data.

### Establishing Relationships
Foreign key constraints are added to `fHistory` to ensure data integrity.

## 3) Data Analysis
The data analysis phase involves executing SQL queries to extract insights from the data. Key areas of analysis include:

### 4Joining Tables
Combining `fHistory` with `cProfiles`, `cDepartments`, and `cSegments` to enrich the sales data with descriptive information.

### Record Count per Table
Calculating the number of records in each table to understand the data volume.

### Maximum Sales Analysis
Identifying the highest sales figures across different departments, profiles, and segments.

### Average Sales by Segment
Determining the average sales for each segment to understand segment performance.

### Total Customers by Department
Summarizing the total number of customers in each department.

### Sales Analysis by Year and Department
Analyzing total sales per department for each year to observe trends over time.

## Conclusion
The `acadiatest2` database serves as a robust platform for storing and analyzing sales data. The data engineering steps ensure a well-structured and normalized database, while the analysis queries provide valuable insights into sales performance, customer demographics, and departmental trends.

## Contact Information
For any queries or feedback, please contact me through my [Linkedin](https://www.linkedin.com/in/vinicius-capozzi)
