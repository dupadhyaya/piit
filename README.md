# Learning objectives
## The material is intended to help learners:
- import data from different sources and export it in useful formats;
- inspect rows, columns, data types, structure, and size;
- find and handle missing values, duplicates, and inconsistencies;
- clean, transform, sort, filter, and slice data;
- combine datasets using merges, joins, and concatenation;
- reshape data between long and wide formats;
- create summaries using grouping and pivot tables;
- identify outliers and understand distributions;
- calculate descriptive statistics and test hypotheses;
- build charts, reports, dashboards, and data stories; and
- prepare for data analyst assignments, projects, and interviews.
- The topics which will be covered are : Excel,Google Sheets,SQL,Python,R,,Tableau,PowerBI, AI,,Other related tools

## Links
-  https://docs.google.com/spreadsheets/d/1ItqKKrg6PSwDAnrQRiD9_KfrTibrJOyWiaoyeEQM51s
- https://docs.google.com/spreadsheets/d/1HWksnj3t1zLrpMVuPu0nBqqztI24kbSiDZWfolHrF6I
- https://docs.google.com/spreadsheets/d/1NTNtEhHe4JShDhZ_DmX_k2u93V_bmVz1t8j9DliCg1A
- https://docs.google.com/spreadsheets/d/19EqsXhG4RF8O1cb6hFDicyM2orrkcRO9z4VCvaPXwiU
- https://docs.google.com/document/d/1F9OwznHskvqrfFYcB5GupV5WbV0gH0j4 Videos
- Synthetic Data : https://www.kdnuggets.com/5-useful-python-scripts-for-synthetic-data-generation

## You can put your issues through this tab/ link
- https://github.com/dupadhyaya/piit/issues
# Data Analysis
- load data from different sources
- save data into different formats
- understand the data structures, how large, names of col, 
- missing values, inconsistencies, cleaning, transformation 
- sort
- filter - conditions; search for string
- slicing - select rows, cols on conditions
- merge data - row, col
- join 
- visualise- bar, pie, presentation, storytelling
- outliers 
- groupby summaries, pivot
- rotate data - long, wide
- statistics - mean, median, mode, std, skewness, kurtosis, correlation, covariance
- data distribution - normal,
- sampling 
# About this Repository
- What this repository is
dupadhyaya/piit is an actively maintained teaching repository for a broad “Professional Data Analyst” curriculum. It is best understood as an instructor’s working course library—not a standalone software application or installable package.
# The README describes coverage of:
-Excel and Google Sheets
-SQL and database connectivity
-Python and R
-Tableau and Power BI
-Statistics, visualization, AI, reporting, and storytelling
-Assignments, projects, and interview preparation
# What is inside as on August 2, 2026:
- 289 tracked files, approximately 149 MiB of material
- 189 Jupyter notebooks, including 153 primary notebooks and 42 tracked checkpoint notebooks
- 21 R scripts
- SQL scripts, SQLite databases, spreadsheets, PDFs, images, and CSV datasets
- 165 commits, all from one contributor
- History from July 2025 through August 2026, indicating ongoing development
- No pull requests and one general-purpose open feedback issue
# The repository is organized by subject:
Module | Subject | Topics |
|---|---|---|
| [01A — Google Sheets](modules/01A-GS/) | Spreadsheet analysis | Functions, lookups, data handling, links, blending, and LOD concepts |
| [01B — Excel](modules/01B-excel/) | Spreadsheet analysis | Excel reference and practice material |
| [02 — SQL](modules/02-SQL/) | Databases and SQL | MySQL, SQLite, DuckDB, queries, window functions, database setup, Python connectivity, pandas, and SQLAlchemy |
| [03 — Python](modules/03-Py/) | Python for data analysis | Fundamentals, data structures, NumPy, pandas, dates, strings, NLP, visualization, statistics, synthetic data, and reporting |
| [06 — Tableau](modules/06-Tb/) | Data visualization | Data sources, joins, blending, filters, groups, sets, LOD expressions, and common chart types |
| [06B — Tableau and Python](modules/06B-TbPy/) | Analytics integration | TabPy, Plotly, Python-powered Tableau workflows, and LOD examples |
| [07 — R](modules/07-R/) | R for data analysis | Data manipulation, visualization, missing data, statistics, MySQL, and Tableau integration |
| [08 — AI](modules/08-AI/) | AI-assisted analysis | Introductory AI workflows in Jupyter
Across the primary notebooks approximately 2,333 code cells and 1,012 Markdown cells. This is substantial instructional content rather than an empty course outline.
## Repository Structure
piit/
├── modules/                 # Main subject-based learning material
│   ├── 01A-GS/              # Google Sheets
│   ├── 01B-excel/           # Microsoft Excel
│   ├── 02-SQL/              # SQL and database connectivity
│   ├── 03-Py/               # Python and data analysis
│   ├── 06-Tb/               # Tableau
│   ├── 06B-TbPy/            # Tableau–Python integration
│   ├── 07-R/                # R programming
│   └── 08-AI/               # AI-related material
├── data/                    # Shared practice datasets
├── misc/
│   ├── assign/              # Course assignments
│   ├── intQs/               # Interview preparation
│   ├── projects/            # Projects and case studies
│   ├── queries/             # Student questions
│   └── reportSB/            # Report writing and storytelling
├── ide/                     # IDE and editor examples
├── README.md
└── piit.Rproj               # RStudio project configuration
# What it does well
- Broad, practical coverage of the modern analyst toolchain
- Hands-on datasets and examples, not merely conceptual notes
- A useful progression from Python basics through pandas, statistics, SQL, visualization, and reporting
- Dedicated assignments and interview-preparation material
- Demonstrates cross-tool workflows such as Python–MySQL, Python–Tableau, R–MySQL, and SQL–pandas
- Continues to receive frequent updates
- Its strongest potential use is as material accompanying live instruction, where the instructor can explain prerequisites, environment setup, and notebook sequencing.

Python topics

The [Python module](modules/03-Py/) is divided into focused sections:

- `ds/` — lists, tuples, sets, dictionaries, strings, iteration, and file operations;
- `pd/` — pandas setup, data loading, cleaning, transformation, aggregation, and plotting;
- `graphs/` — matplotlib, seaborn, Plotly, pandas plotting, and graph selection;
- `stats/` — descriptive statistics, distributions, sampling, hypothesis tests, ANOVA, chi-square tests, t-tests, z-tests, and A/B testing;
- `nlp/` — regular expressions and text processing;
- `dates/` — date and time handling;
- `reports/` — analytical reports, figures, and PDF output;
- `others/` — functions, loops, lambda expressions, synthetic data, and supporting topics; and
- `cheatSheet/` — quick-reference material.

## SQL topics

The [SQL module](modules/02-SQL/) includes:

- SQL fundamentals and practice queries;
- MySQL setup and sample databases;
- grouping, aggregation, and window functions;
- Python connections using MySQL Connector and PyMySQL;
- SQLAlchemy;
- SQLite and DuckDB;
- SQL with pandas; and
- data import and export workflows.

## Assignments and projects

- [Assignments](misc/assign/) provide guided practice across Python, SQL, Tableau, Google Sheets, and AI.
- [Projects](misc/projects/) contain case studies and end-to-end analytical exercises.
- [Interview preparation](misc/intQs/) contains technical questions, process guidance, and supporting documents.
- [Report writing and storytelling](misc/reportSB/) covers communicating analytical findings.

## Datasets

The [`data/`](data/) folder contains datasets for classroom demonstrations and practice, including:

- Global Superstore;
- Tableau Superstore orders, people, and returns;
- Olist customers, orders, and order items;
- `mtcars`;
- student datasets; and
- SQL and spreadsheet practice files.
