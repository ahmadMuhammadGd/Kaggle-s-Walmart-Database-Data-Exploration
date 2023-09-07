## Kaggle-s-Walmart-Database-Data-Exploration
![Intro](https://github.com/ahmadMuhammadGd/Kaggle-s-Walmart-Database-Data-Exploration-and-visualization/assets/121247258/833ef47c-1abe-411a-ad02-555958d8162f)

Database link: https://www.kaggle.com/datasets/yasserh/walmart-dataset
SQL code is an exploration of various factors related to sales in the Walmart dataset. Here's a breakdown of each section:

## Overview
This repository contains an analysis of various factors related to sales in the Walmart dataset. The analysis is performed using Python for data exploration and visualization. Additionally, a Tableau visualization is included for a more comprehensive understanding of the dataset.

Section 1: Exploring Holidays
- The query selects distinct dates and the holiday flag from the Walmart table where the holiday flag is set to 1 (indicating a holiday).
- It retrieves the data for 10 holidays that have been found.

Section 2: Preparing Data for Visualization Purposes
- The query calculates the average sales per week, average temperature per week, average fuel price per week, average CPI per week, and average unemployment per week.
- It groups the data by date and orders it by date in ascending order.

Section 3: Exploring Sales on Normal Days vs. Holidays
- The query calculates the average sales, average sales on holidays, and average sales on rest days for each date.
- It groups the data by date and orders it by average sales in descending order.
- The results show the impact of holidays on average total sales per week, with the highest average sales observed during preparations for Christmas and other holidays.

Section 4: Exploring the Relationship Between Average Temperature and Average Sales
- The query calculates the average sales, average temperature in Celsius, and average temperature in Fahrenheit for each date.
- It groups the data by date and holiday flag.
- The results suggest that temperature may not play a crucial role in average sales per week.

Section 5: Exploring the Relationship Between Unemployment and Average Weekly Sales
- The first query calculates the average sales and unemployment rate per store.
- The second query calculates the overall unemployment variance.
- The results indicate that unemployment does not play a crucial role in average sales per store.

Section 6: Exploring the Relationship Between Average Temperature, Average Sales, and Employment
- The query calculates the average sales, average unemployment, average CPI, minimum average CPI, and maximum average CPI per date.
- The results suggest that the CPI (Consumer Price Index) may have a significant effect on average sales.

Section 7: Exploring the Relationship Between Average Fuel Price and Average Sales
- The query calculates the average sales, average fuel price, and average CPI per date.
- The results suggest that fuel price may have a significant effect on average sales.

Each section explores different factors and their potential impact on average sales. The queries retrieve the necessary data, perform calculations, and present the results for further analysis and visualization purposes.


## Python Code
We begin with the Python code to explore the Walmart dataset. The code performs the following tasks:

### Data Loading
- Loads the dataset from the 'Walmart.csv' file using the pandas library.

### Data Exploration and Cleaning
- Displays a snapshot of the dataset to provide an overview of the data structure.
- Identifies and displays duplicate entries in the dataset.

### Correlation Analysis
![image](https://github.com/ahmadMuhammadGd/Kaggle-s-Walmart-Database-Data-Exploration-and-visualization/assets/121247258/ca1079e4-09bf-48d4-ab5e-02dbfddffd5f)
- Calculates the correlation matrix for key variables, including 'Weekly_Sales,' 'Holiday_Flag,' 'Temperature,' 'Fuel_Price,' 'CPI,' and 'Unemployment.'
- Exports the correlation matrix to 'corr.csv' for further reference.
- Visualizes the correlation matrix using a heatmap with a grayscale color map.

### Scatterplot Visualization
![image](https://github.com/ahmadMuhammadGd/Kaggle-s-Walmart-Database-Data-Exploration-and-visualization/assets/121247258/83100589-4c01-4596-8c1a-e00e7e206a2e)
- Selects specific columns for scatterplot visualization, excluding 'Date' and 'Store.'
- Creates scatterplots to explore the relationships between 'Weekly_Sales' and other variables, with all data points represented in black.

## Tableau Visualization
![Overview](https://github.com/ahmadMuhammadGd/Kaggle-s-Walmart-Database-Data-Exploration-and-visualization/assets/121247258/32650106-a340-49f1-ba65-d01db682d446)
The Tableau visualization provides a dynamic and interactive representation of the sales data. It offers insights into various aspects of sales trends and relationships between key factors.
https://public.tableau.com/app/profile/ahmad.muhammad7652/viz/walmart_16939729940010/Intro?publish=yes
![Correlation](https://github.com/ahmadMuhammadGd/Kaggle-s-Walmart-Database-Data-Exploration-and-visualization/assets/121247258/1b5eba1b-38b9-4f6b-9193-52ceea47f358)
![Common patterns](https://github.com/ahmadMuhammadGd/Kaggle-s-Walmart-Database-Data-Exploration-and-visualization/assets/121247258/9f36d110-9edd-4d55-850a-e99c5a0ac7d0)

## Data Analysis Insights
The analysis reveals interesting patterns, such as increased sales leading up to Christmas and Thanksgiving, followed by declines. Despite these declines, sales remain relatively high, possibly due to holiday preparations. The impact of factors like temperature, unemployment, fuel prices, and CPI on sales is explored, providing valuable insights for further analysis and decision-making.

Please refer to the code and Tableau visualization for more detailed insights into the Walmart sales dataset.

This README was written using GPT-3

