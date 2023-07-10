# Kaggle-s-Walmart-Database-Data-Exploration
Database link: https://www.kaggle.com/datasets/yasserh/walmart-dataset
the code is an exploration of various factors related to sales in the Walmart dataset. Here's a breakdown of each section:

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
