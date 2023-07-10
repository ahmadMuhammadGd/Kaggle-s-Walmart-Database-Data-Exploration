------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
--										                  EXPLORING HOLIDAYS
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

SELECT DISTINCT WLMRT.DATE, WLMRT.Holiday_Flag
FROM WALLMART.DBO.WALMART AS WLMRT
WHERE WLMRT.Holiday_Flag = 1
--RESULTS:
--10 HOLIDAYS HAS BEEN FOUND

--PREPARING DATA FOR VISUALIZATION PURPOSES
SELECT	WLMRT.DATE, AVG(WLMRT.WEEKLY_SALES) AVERAGE_SALES_PER_WEEK,
		AVG(WLMRT.Temperature) AVERAGE_TEMPRATURE_PER_WEEK,
		AVG(WLMRT.FUEL_PRICE) AVERAGE_FUEL_PRICE_PER_WEEK,
		AVG(WLMRT.CPI) AVERAGE_CPI_PER_WEEK,
		AVG(WLMRT.UNEMPLOYMENT) AVERAGE_UNEMPLOYMENT_PER_WEEK
FROM WALLMART.DBO.WALMART AS WLMRT
GROUP BY WLMRT.DATE
ORDER BY WLMRT.DATE ASC
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
--								          EXPLORING SLAES IN NORMAL DAYAS VS HOLIDAYS
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

SELECT WLMRT.Date, 
		AVG(WLMRT.Weekly_Sales) AS AVERAGE_SALES,
		AVG(CASE WHEN WLMRT.Holiday_Flag = 1 THEN WLMRT.Weekly_Sales ELSE NULL END) AS AVGSALES_ON_HOLIDAYS,
		AVG(CASE WHEN WLMRT.Holiday_Flag = 0 THEN WLMRT.Weekly_Sales ELSE NULL END) AS AVGSALES_ON_RESTDAYS
FROM WALLMART.DBO.WALMART AS WLMRT
GROUP BY WLMRT.Date
ORDER BY AVERAGE_SALES DESC;

-- RESULTS:
-- CHECKING HOLIDAYS EFFECT ON AVERAGE TOTAL SALARY PER WEEK
-- COMPARED TO NORMAL DAYS ORDERED BY AVERAGE SALE ON EACH WEEK
-- HIGHEST AVERAGE SALES PER WEEK WERE RECORDED WHEN PEOPLE WERE PREPARING FOR CHRISTMAS HOLYDAY:
--					2010-12-24		==>		1798475.90520833
--					2011-12-23		==>		1711072.02361111
-- HIGHEST AVERAGE SALES PER WEEK WERE RECORDED AT HOLIDAYS WERE SYNCED WITH Thanksgiving Day,
-- AND International Aura Awareness Day:
--					2011-11-25		==>		1479857.88958333
--					2010-11-26		==>		1462688.96180556
-- AVERAGE SALES PER WEEK WERE SIGNIFICALLY LOW AT CHRISTMAS DAY
--					2010-12-31		==>		898500.424652778
-- AVERAGE SALE PER WEEK DROPS DRAMATICLY IN JAN.
--					2012-01-27		==>		885221.660069444
--					2011-01-28		==>		879996.732638889

-- TO SUPPORT THAT HYPOTHESIS:
SELECT WLMRT.Date, AVG(WLMRT.Weekly_Sales) AS AVERAGE_SALES
FROM WALLMART.DBO.WALMART AS WLMRT
	--COMPARING AVG SALES PER WEEK IN DEC, JAN, AND MAR.
	WHERE WLMRT.Date LIKE '20%-01-%' OR WLMRT.Date LIKE '20%-02-%' OR WLMRT.Date LIKE '20%-12-%'
	GROUP BY WLMRT.Date
	ORDER BY AVERAGE_SALES ASC;

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
--				    EXPLORIGN THE RELATIONSHIP BETWEEN AVERAGE TEMPERATURE AND AVERAGE SALES
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT WLMRT.Date,
		AVG(WLMRT.Weekly_Sales) AS AVERAGE_SALES,
		AVG((WLMRT.TEMPERATURE - 32) * 5/9) AS AVERAGE_TEMPRATURE_CEL,
		AVG(WLMRT.TEMPERATURE) AS AVERAGE_TEMPRATURE_FEH
FROM WALLMART.DBO.WALMART AS WLMRT
GROUP BY WLMRT.Date, WLMRT.Holiday_Flag
ORDER BY WLMRT.Date DESC;
--RESULTS:
--IT SEEMS THAT TEMPRATURE MAY NOT PLAY CRUCIAL ROLE IN THE AVERAGE SALES PER WEEK

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
--			    	EXPLORIGN THE RELATIONSHIP BETWEEN UNEMPLOYEMENT AND THE AVERAGE WEEKLY SALES 
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT	 
		WLMRT.STORE AS STORE, 
		AVG(WLMRT.Weekly_Sales) AS AVERAGE_SALES, 
		AVG(WLMRT.UNEMPLOYMENT) AS UNEMPLOYMENT
FROM WALLMART.DBO.WALMART AS WLMRT
		--COMPARING AVG SALES PER WEEK IN DEC, JAN, AND MAR.
		GROUP BY STORE
		ORDER BY AVERAGE_SALES DESC;
--EXPLORING UNEMPLOYEMENT VARIANCE
SELECT AVG(WLMRT.UNEMPLOYMENT) AS UNEMP
FROM WALLMART.DBO.WALMART AS WLMRT
--ORDER BY UNEMP ASC;
ORDER BY UNEMP DESC;
-- UNEMPLOYMENT DOESN'T PLAY CRUCIAL ROLE IN THIS CASE, UNEMPLOYEMENT VARIES BETWEEN 3.87899994850159, AND 14.3129997253418
-- STORE 20, WHICH HAS THE HIGHEST AVERAGE SALES IS LOCATED AT AVERAGE UNEMPLOYMENT AREA WITH 7.37141263735044 PERCENT
-- STORE 33, WHICH HAS THE LOWEST AVERAGE SALES IS LOCATED AT AVERAGE UNEMPLOYMENT ARIA WITH 8.53315394741672 PERCENT
-- STORE 15, WHICH HAS MEDIUM AVERAGE SALES IS LOCATED AT AVERAGE UNEMPLOYMENT ARIA WITH 7.99625181318163 PERCENT
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
--		   EXPLORIGN THE RELATIONSHIP BETWEEN AVERAGE TEMPERATURE AND AVERAGE SALES AND EMPLOYMENT
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT	WLMRT.DATE,
		AVG(WLMRT.Weekly_Sales) AS AVERAGE_SALES,
		AVG(WLMRT.UNEMPLOYMENT) AS AVERAGE_UNEMPLOYMENT,
		AVG(WLMRT.CPI) AS AVERAGE_CPI,
		(SELECT MIN(AVG_CPI) 
		 FROM (
				SELECT TOP 1 AVG(CPI) AS AVG_CPI 
				FROM WALLMART.DBO.WALMART 
				GROUP BY DATE 
				ORDER BY AVG_CPI ASC) AS CPI_SUBQUERY_1
				) AS MIN_AVERAGE_CPI,
		(SELECT MAX(AVG_CPI)
		FROM (
				SELECT TOP 1 AVG(CPI) AS AVG_CPI 
				FROM WALLMART.DBO.WALMART 
				GROUP BY DATE 
				ORDER BY AVG_CPI DESC) AS CPI_SUBQUERY_2
				) AS MAX_AVERAGE_CPI

FROM WALLMART.DBO.WALMART AS WLMRT
GROUP BY WLMRT.DATE
ORDER BY AVERAGE_SALES DESC;
-- IT SEEMS THAT CPI MAY HAVE SEGNIFICANT EFFECT ON AVERAGE SALES
-- THE MINIMUM AVERAGE CPI FOUND WAS:		167.546485900879
-- THE MAXIMUM AVERAGE CPI FOUND WAS:		176.652612304687
---------------------------------------------------------------------
-- DATE		  AVERAGE WEEKLY SALES	AVERAGE CPI
-- 2010-12-24	1798475.90520833	168.468876139323
-- 2011-12-23	1711072.02361111	173.867631700304
---------------------------------------------------------------------
SELECT	WLMRT.DATE,
		AVG(WLMRT.Weekly_Sales) AS AVERAGE_SALES,
		AVG(WLMRT.UNEMPLOYMENT) AS AVERAGE_UNEMPLOYMENT,
		AVG(WLMRT.CPI) AS AVERAGE_CPI
FROM WALLMART.DBO.WALMART AS WLMRT
GROUP BY WLMRT.DATE
ORDER BY AVERAGE_CPI DESC;


------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
--				       EXPLORIGN THE RELATIONSHIP BETWEEN AVERAGE FUEL PRICE AND AVERAGE SALES
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT	WLMRT.DATE,
		AVG(WLMRT.Weekly_Sales) AS AVERAGE_SALES,
		AVG(WLMRT.Fuel_Price) AS AVERAGE_FUEL_PRICE,
		AVG(WLMRT.CPI) AS AVERAGE_CPI
FROM WALLMART.DBO.WALMART AS WLMRT
GROUP BY WLMRT.DATE
ORDER BY AVERAGE_SALES DESC;
-- IT SEEMS THAT FUEL PRICE MAY HAVE SEGNIFICANT EFFECT ON AVERAGE SALES
