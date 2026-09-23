
# HR Employee Attrition Analysis

##  Project Overview

This project analyzes employee attrition using **SQL Server and Power BI**.

The objective is to understand employee attrition patterns across different departments, job roles, salary levels, overtime status, business travel, marital status, and years at the company.

The analysis was performed on a dataset containing **1,470 employee records**.

---

##  Tools & Technologies

* **SQL Server** – Data analysis and querying
* **Power BI** – Interactive dashboard and visualization
* **DAX** – Measures and calculations
* **Excel** – Initial data inspection and validation
* **GitHub** – Project documentation and version control

---

##  Dataset

The dataset contains employee information such as:

* Employee ID
* Gender
* Age
* Business Travel
* Department
* Distance From Home
* State
* Ethnicity
* Education
* Education Field
* Job Role
* Marital Status
* Salary
* Stock Option Level
* Overtime
* Hire Date
* Attrition
* Years at Company
* Years in Most Recent Role
* Years Since Last Promotion
* Years With Current Manager

---

## 🧹 Data Cleaning & Validation

The dataset was checked before performing the analysis.

### Data validation performed:

* Checked for missing values
* Checked for duplicate records
* Verified data types
* Checked categorical values
* Cleaned inconsistent text values
* Removed unnecessary spaces from categorical fields such as Business Travel

The dataset contained **1,470 employee records**.

---

##  SQL Analysis

SQL Server was used to analyze employee attrition and identify patterns.

### Key SQL Analysis

* Total number of employees
* Number of employees who left
* Overall attrition rate
* Attrition rate by department
* Attrition rate by job role
* Attrition rate by overtime status
* Attrition rate by business travel
* Attrition rate by marital status
* Average salary of employees who left vs stayed
* Attrition based on years at company
* Attrition based on salary bands
* Highest-paid employees by department
* Ranking departments by attrition rate

### SQL Concepts Used

* `SELECT`
* `WHERE`
* `GROUP BY`
* `ORDER BY`
* `CASE WHEN`
* Aggregate functions
* `HAVING`
* Subqueries
* CTEs
* Window functions
* `RANK()`
* `ROW_NUMBER()`

---

##  Key Findings

### Overall Attrition

* Total Employees: **1,470**
* Employees Who Left: **237**
* Employees Who Stayed: **1,233**
* Overall Attrition Rate: **16.12%**

### Attrition by Department

| Department      | Employees | Employees Left | Attrition Rate |
| --------------- | --------: | -------------: | -------------: |
| Sales           |       446 |             92 |         20.63% |
| Human Resources |        63 |             12 |         19.05% |
| Technology      |       961 |            133 |         13.84% |

### Overtime

| Overtime | Employees | Employees Left | Attrition Rate |
| -------- | --------: | -------------: | -------------: |
| Yes      |       416 |            127 |         30.53% |
| No       |     1,054 |            110 |         10.44% |

### Salary

The average salary was approximately:

* Employees who left: **82,262**
* Employees who stayed: **118,856**

The `<30K` salary band had an observed attrition rate of approximately **28.66%**.

> These findings represent patterns observed in this dataset and should not be interpreted as proof of causation.

---

## Power BI Dashboard

Power BI was used to create an interactive HR Attrition Dashboard.

### KPI Cards

* Total Employees
* Employees Left
* Employees Stayed
* Attrition Rate
* Average Salary

### Dashboard Visuals

* Attrition by Department
* Attrition by Job Role
* Attrition by Overtime
* Attrition by Salary Band
* Attrition by Tenure
* Attrition by Business Travel
* Attrition by Marital Status

### Slicers

Users can filter the dashboard using:

* Department
* Job Role
* Gender
* Business Travel
* Overtime
* Marital Status
* Salary Band
* Tenure Band

---

##  DAX Measures

### Total Employees

```DAX
Total Employees =
DISTINCTCOUNT(Employee[EmployeeID])
```

### Employees Who Left

```DAX
Attrition Count =
CALCULATE(
    DISTINCTCOUNT(Employee[EmployeeID]),
    Employee[Attrition] = 1
)
```

### Attrition Rate

```DAX
Attrition Rate =
DIVIDE(
    [Attrition Count],
    [Total Employees],
    0
)
```

### Employees Stayed

```DAX
Employees Stayed =
CALCULATE(
    [Total Employees],
    Employee[Attrition] = 0
)
```

### Average Salary

```DAX
Average Salary =
AVERAGE(Employee[Salary])
```

---

## 📁 Project Structure

```text
HR-Employee-Attrition-Analysis/
│
├── data/
│   └── HR_Employee_Data.csv
│
├── sql/
│   └── HR_Attrition_Analysis.sql
│
├── powerbi/
│   └── HR_Attrition_Dashboard.pbix
│
├── screenshots/
│   └── dashboard.png
│
└── README.md
```

---

##  Business Questions

This project answers questions such as:

1. How many employees left the company?
2. What is the overall attrition rate?
3. Which department has a higher observed attrition rate?
4. Which job roles have higher attrition rates?
5. Does attrition differ between employees working overtime and those who do not?
6. How does salary differ between employees who left and stayed?
7. How does business travel relate to attrition?
8. How does tenure relate to employee attrition?
9. Which salary bands have higher observed attrition?
10. Which departments have an attrition rate above the company-level rate?

---

##  Skills Demonstrated

This project demonstrates practical skills in:

* SQL querying
* Data cleaning
* Exploratory data analysis
* Data aggregation
* CTEs and subqueries
* Window functions
* DAX
* Power BI dashboard development
* KPI creation
* Data visualization
* Business-oriented data analysis

---

##  Author

**Shiva Shankar Reddy**

**Data Analyst | SQL | Python | Power BI | Excel**
 
