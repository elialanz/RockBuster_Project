# Rockbuster SQL Analysis

## Project Overview
This repository presents a structured SQL analysis project built around the Rockbuster relational database. The project focuses on using SQL to explore customer distribution, revenue patterns, data quality, and business performance across multiple related tables. The work was completed in PostgreSQL and organized as a professional portfolio project to demonstrate practical database analysis, query design, and stakeholder-ready deliverables. 

## Business Objective
The goal of this project was to use relational database analysis to answer business-focused questions relevant to management decision-making. Key areas of analysis included customer geography, top-performing markets, top customers by revenue contribution, data profiling, and query structuring using joins, subqueries, and common table expressions (CTEs). The final outputs were prepared for both business and technical audiences. 

## Tools Used
- PostgreSQL
- pgAdmin 4
- SQL
- Excel
- Tableau Public
- PowerPoint

The project also used ERD extraction and data dictionary documentation to support structured querying and database understanding. 

## Project Scope
This project covers the following areas:
- relational database setup and restoration
- schema exploration and ERD interpretation
- SQL querying, filtering, grouping, and aggregation
- query optimization using `EXPLAIN`
- data cleaning and data profiling
- multi-table joins for business analysis
- subqueries and CTEs for more advanced SQL logic
- export of SQL outputs for technical review and business presentation
- final communication of findings through spreadsheet outputs and presentation deliverables. 

## Key Business Questions Explored
Examples of business questions addressed in this project include:
- Which countries have the highest customer counts?
- Which cities within those priority countries have the strongest customer concentration?
- Who are the top customers by total amount paid?
- What patterns can be identified in rental rates, rental duration, and other descriptive metrics?
- How can SQL query outputs be transformed into manager-friendly visual deliverables? 

## SQL Techniques Demonstrated
This repository includes SQL work across several levels of complexity, including:
- `SELECT`, `FROM`, `WHERE`, `ORDER BY`, `LIMIT`
- `GROUP BY`, `HAVING`, `DISTINCT`
- aggregate functions such as `COUNT`, `MIN`, `MAX`, `AVG`, and `SUM`
- `CASE` statements for derived logic
- duplicate checks and data quality review
- `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL JOIN`, and multiple joins
- subqueries in `SELECT`, `WHERE`, and `FROM`
- CTEs using `WITH ... AS`
- query planning and cost comparison with `EXPLAIN`. 

## Repository Structure

### [01] Project Brief & Planning
Project scoping documents and planning materials used to frame the analysis.
[→→→](https://github.com/elialanz/RockBuster_Project/tree/main/%5B01%5D%20Project%20Brief%20%26%20Planning)

### [02] Data
#### [1] Original Data
Contains the original Rockbuster database backup and source notes.
[→→→](https://github.com/elialanz/RockBuster_Project/tree/main/%5B02%5D%20Data/%5B1%5D%20Original%20Data)

#### [2] Data Checks & Cleaning
Contains the entity relationship diagram, ERD export, data dictionary, and SQL work related to schema understanding, data quality checks, and profiling.

#### [3] Prepared Data
Contains selected CSV exports and prepared outputs used for analysis and visualization.

### [03] SQL Scripts
Contains the main SQL scripts used throughout the project, including:
- schema exploration
- foundational CRUD examples
- query optimization and aggregation
- filtering and case logic
- data cleaning and profiling
- customer and revenue analysis with joins
- subquery-based analysis
- CTE-based analysis
- visualization support queries

### [04] Analysis & Visualizations
#### [1] Reports
Technical outputs and analysis notes.

#### [2] Visualizations
Presentation assets, visualization references, and exported visuals.

#### [3] Test Files
Reserved for minimal supporting files only.

### [05] Final Deliverables
Contains the main project outputs for review:
- final presentation
- technical query output workbook
- finalized data dictionary
- deliverables summary. 

## Recommended Files to Review First
If you are reviewing this project as a recruiter or hiring manager, the best starting points are:
1. `[05] Final Deliverables/rockbuster_analysis_presentation.pptx`
2. `[05] Final Deliverables/rockbuster_query_outputs.xlsx`
3. `[05] Final Deliverables/rockbuster_data_dictionary.pdf`
4. `[03] SQL Scripts/07_customer_revenue_geography_analysis.sql`
5. `[03] SQL Scripts/08_subquery_analysis.sql`
6. `[03] SQL Scripts/09_cte_analysis.sql`

These files provide the clearest view of the business questions, technical SQL capability, and final communication outputs. 

## Final Deliverables
The final deliverables for this project include:
- a manager-facing presentation of key findings
- an Excel file containing SQL queries and result outputs for technical review
- a finalized data dictionary documenting tables, keys, and relationships
- supporting SQL scripts used to generate the analysis. :contentReference[oaicite:8]{index=8}

## Reproducibility
To reproduce this project:
1. Restore the Rockbuster database from the provided backup file in PostgreSQL.
2. Review the ERD and data dictionary to understand the schema and relationships.
3. Run the SQL scripts in sequence or by analysis area, depending on your objective.
4. Use the prepared CSV outputs or re-run the visualization support queries as needed.
5. Review the final presentation and technical outputs for the project summary. 

## Skills Demonstrated
This project demonstrates:
- relational database understanding
- structured SQL analysis in PostgreSQL
- data profiling and quality checks
- business-oriented multi-table analysis
- advanced SQL structuring with subqueries and CTEs
- technical and non-technical communication of results
- project organization and documentation suitable for portfolio presentation. 

## Notes
This repository has been curated to present the project as a professional SQL analysis portfolio piece. Tutor submission artifacts, duplicate exports, and non-essential coursework packaging have been excluded from the public-facing structure so the focus remains on the analysis workflow, SQL capability, and final deliverables.

## Contact
If you would like to discuss this project, my analytical workflow, or related portfolio work, feel free to connect with me via LinkedIn or GitHub.
