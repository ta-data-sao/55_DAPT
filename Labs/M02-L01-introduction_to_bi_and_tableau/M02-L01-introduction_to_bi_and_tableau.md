![Ironhack logo](https://i.imgur.com/1QgrNNw.png)

# Lab | Introduction to BI and Tableau

## Introduction

In this lab, we will practice loading data into Tableau, inspecting and modifying data types, and creating tabular views with metrics based on the information contained in the data set. We will be working with a liquor store sales data set.
If you get stuck on any of the tasks in this lab, you can reference the excellent training video resources provided on the [Tableau website](https://www.tableau.com/learn/training). We have also referenced specific articles on topics such as binning variables and creating aliases that should be helpful in completing this lab.

## Getting Started

To complete this lab, follow each of the steps below.

1. Download the [data set](https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/ta-data-sao/55_DAPT/tree/master/Labs/M02-L01-introduction_to_bi_and_tableau).
2. Launch the Tableau application.
3. Import the dataset into Tableau through the `Text File` option.
4. Use `;` (semicolon) as field separator.
5. Once the data set has been imported, let's start by doing some cleaning:
    - Change the [data type](https://help.tableau.com/current/pro/desktop/en-us/datafields_typesandroles_datatypes.htm) of `Year` and `Month` fields to date.
    - Then, create a [custom date](https://help.tableau.com/current/pro/desktop/en-us/dates_custom.htm) field for both `Year` and `Month` fields (one at a time). Set the `detail` field to Years and Months, respectively, and, since we want the new fields to be discrete, select `Date Part` in both cases.
    - Now, create a new field called `Quarter` by [grouping](https://help.tableau.com/current/pro/desktop/en-us/sortgroup_groups_creating.htm) the newly-created month field (it's probably called `Month (Months)`). Name the groups as Q1, Q2, Q3 and Q4, according to the quarters.
    - Optional: create a [hierarchy](https://help.tableau.com/current/pro/desktop/en-us/qs_hierarchies.htm) called `Date`, and arrange the three new fields properly into it.

Finally, to the viz! In the following task, try exploring the available graph models in the `Show Me` section! (If necessary, fix the order of fields!)

6. Create worksheets with views for each of the following metrics:
    - Total `Retail Sales` (columns) by `Year`/`Quarter` (rows).
    - Total `Retail Sales` (columns) by `Year`/`Quarter` (rows) and `Item Type` (colour).
    - Average `Retail Sales` (columns) by `Year`/`Quarter` (rows).
    - Average `Retail Sales` (columns) by `Year`/`Quarter` (rows) and `Item Type` (colour).
    - Total `Retail Sales` (columns) by `Year`/`Month`.
    - Total `Retail Sales` (columns) by `Year`/`Month` and `Item Type` (colour).
    - Average `Retail Sales` (columns) by `Year`/`Month` (rows).
    - Average `Retail Sales` (columns) by `Year`/`Month` (rows) and `Item Type` (colour).
    - (If you want to practice, repeat the previous tasks, but change `Retail Sales` to `Retail Transfers` and/or to `Warehouse Sales`. You can also try adding information into other `Marks` - such as `Size`, `Label`, `Detail` and `Tooltip`.)
7. Save your work to Tableau Public, ensure that your workbook is viewable. It might take several minutes for this workbook to save to Tableau Public due to the number of records in the data set.

## Resources

- [Data Types](https://help.tableau.com/current/pro/desktop/en-us/datafields_typesandroles_datatypes.htm)

- [Create Custom Date](https://help.tableau.com/current/pro/desktop/en-us/dates_custom.htm)

- [Create Group](https://help.tableau.com/current/pro/desktop/en-us/sortgroup_groups_creating.htm)

- [Create Hierarchy](https://help.tableau.com/current/pro/desktop/en-us/qs_hierarchies.htm)

- [Tableau Training Videos](https://www.tableau.com/learn/training)
