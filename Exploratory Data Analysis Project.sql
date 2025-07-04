-- Exploratory Data Analysis

-- Here we are jsut going to explore the data and find trends or patterns or anything interesting like outliers

-- normally when you start the EDA process you have some idea of what you're looking for

-- with this info we are just going to look around and see what we find!

SELECT *
FROM layoffs_stagging2 ;

-- Easier

SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_stagging2 ;

-- Which companies had 1 which is basically 100 percent of they company laid off
SELECT *
FROM layoffs_stagging2 
WHERE percentage_laid_off = 1
ORDER BY total_laid_off  DESC ;

SELECT *
FROM layoffs_stagging2 
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions  DESC ;


SELECT company, SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY company
ORDER BY 2 DESC ;

SELECT MIN(`date`), max(`date`)
FROM layoffs_stagging2 ;



SELECT industry, SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY industry
ORDER BY 2 DESC ;

SELECT *
FROM layoffs_stagging2 ;

SELECT country, SUM(total_laid_off) -- LAID_OFF --> fired
FROM layoffs_stagging2
GROUP BY country
ORDER BY 2 DESC ;

-- now checking by date which month ,which day it happen most
SELECT `date` , SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY  `date`
ORDER BY 1 DESC ;

SELECT YEAR(`date`) , SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY  YEAR(`date`)
ORDER BY 1 DESC ;

SELECT stage , SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY  stage
ORDER BY 2 DESC ;


-- tougher work
SELECT SUBSTRING(`date`,6,2) AS 'MONTH', SUM(total_laid_off)
FROM  layoffs_stagging2
GROUP BY SUBSTRING(`date`,6,2) ;

SELECT SUBSTRING(`date`,1,7) AS 'MONTH', SUM(total_laid_off)
FROM  layoffs_stagging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY SUBSTRING(`date`,1,7)
ORDER BY 1 ASC ;


# Using CTC to add total laid off in ASC
WITH Rolling_Total AS
(
SELECT SUBSTRING(`date`,1,7) AS `MONTH`, SUM(total_laid_off) AS total_off
FROM  layoffs_stagging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC 
)
SELECT `MONTH` ,total_off
,SUM(total_off) OVER(ORDER BY `MONTH`) AS rolling_total
FROM Rolling_Total ;



# checking the company
SELECT company,SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY company
ORDER BY 2 DESC ;

# AS WELL AS DATE
SELECT company,YEAR(`date`) ,SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY company, YEAR(`date`)
ORDER BY company ASC ;

-- NOW LETS check which company more laids off 
SELECT company,YEAR(`date`) ,SUM(total_laid_off)
FROM layoffs_stagging2
GROUP BY company, YEAR(`date`)
ORDER BY 3 DESC ;


-- USING CTC
WITH Company_Year(company,years,total_laid_off) AS
(
SELECT company,YEAR(`date`) ,SUM(total_laid_off)
FROM layoffs_stagging2
 -- WHERE total_laid_off IS NOT NULL 
GROUP BY company, YEAR(`date`)

)
SELECT *
FROM Company_Year ;

-- CHECKING who most laid off the people in the year

WITH Company_Year(company,years,total_laid_off) AS
(
SELECT company,YEAR(`date`) ,SUM(total_laid_off)
FROM layoffs_stagging2
 -- WHERE total_laid_off IS NOT NULL 
GROUP BY company, YEAR(`date`)

)
SELECT *,
DENSE_RANK() OVER(PARTITION BY years  ORDER BY  total_laid_off DESC) AS Ranking
FROM Company_Year 
WHERE years IS NOT NULL
ORDER BY Ranking ASC ;


-- now fitering ranking by sequence of the company per year

WITH Company_Year(company,years,total_laid_off) AS
(
SELECT company,YEAR(`date`) ,SUM(total_laid_off)
FROM layoffs_stagging2
 -- WHERE total_laid_off IS NOT NULL 
GROUP BY company, YEAR(`date`)

)
SELECT *
FROM Company_Year ;

-- CHECKING who most laid off the people in the year

WITH Company_Year(company,years,total_laid_off) AS
(
SELECT company,YEAR(`date`) ,SUM(total_laid_off)
FROM layoffs_stagging2
 -- WHERE total_laid_off IS NOT NULL 
GROUP BY company, YEAR(`date`)

),   Company_Year_Rank AS
(
SELECT *,
DENSE_RANK() OVER(PARTITION BY years  ORDER BY  total_laid_off DESC) AS Ranking
FROM Company_Year 
WHERE years IS NOT NULL
ORDER BY Ranking ASC 
)
SELECT *
FROM Company_Year_Rank ;

-- NOW FILTERING THE TOP 5 COMPANIES PER YEAR

WITH Company_Year(company,years,total_laid_off) AS
(
SELECT company,YEAR(`date`) ,SUM(total_laid_off)
FROM layoffs_stagging2
 -- WHERE total_laid_off IS NOT NULL 
GROUP BY company, YEAR(`date`)

),   Company_Year_Rank AS
(
SELECT *,
DENSE_RANK() OVER(PARTITION BY years  ORDER BY  total_laid_off DESC) AS Ranking
FROM Company_Year 
WHERE years IS NOT NULL
ORDER BY Ranking ASC 
)
SELECT *
FROM Company_Year_Rank
WHERE Ranking <= 5 ;








