
-- create a temporary table to calculate news uptake and number of news articles
WITH
NewsCount AS (
SELECT
Reference,
COUNT() as Count
FROM News_table
GROUP BY Reference -- counts the number according to the reference
)

SELECT
Reference,
Meta_table.Sample,
Meta_table.Institution as Institution,

-- NEED TO ADD INSTITUTION NAMES HERE
CASE
WHEN Institution = 1 THEN "Birmingham"
WHEN Institution = 2 THEN "Bristol"
WHEN Institution = 3 THEN "Cambridge"
WHEN Institution = 4 THEN "Cardiff"
WHEN Institution = 5 THEN "Durham"
WHEN Institution = 6 THEN "Edinburgh"
WHEN Institution = 7 THEN "Exeter"
WHEN Institution = 8 THEN "Glasgow"
WHEN Institution = 9 THEN "Imperial"
WHEN Institution = 10 THEN "Kings"
WHEN Institution = 11 THEN "Leeds"
WHEN Institution = 12 THEN "Liverpool"
WHEN Institution = 13 THEN "LSE"
WHEN Institution = 14 THEN "Manchester"
WHEN Institution = 15 THEN "Newcastle"
WHEN Institution = 16 THEN "Nottingham"
WHEN Institution = 17 THEN "Oxford"
WHEN Institution = 18 THEN "QMUL"
WHEN Institution = 19 THEN "Belfast"
WHEN Institution = 20 THEN "Sheffield"
WHEN Institution = 21 THEN "Southampton"
WHEN Institution = 22 THEN "UCL"
WHEN Institution = 23 THEN "Warwick"
WHEN Institution = 24 THEN "York"
WHEN Institution = 25 THEN "BMJ"
WHEN Institution = 26 THEN "Biomed"
WHEN Institution = 27 THEN "MRC"
WHEN Institution = 29 THEN "Leicester"
WHEN Institution = 32 THEN "Kent"
WHEN Institution = 33 THEN "FFS"
END
Institution_Name,

PRDraft_table.RCT_Condition as Condition,

-- add in news count and total news
CASE
    WHEN NewsCount.Count IS NOT NULL
    THEN 1 ELSE 0
END
News_Uptake,
CASE
    WHEN NewsCount.Count IS NOT NULL
    THEN NewsCount.Count ELSE 0
END
Total_News

FROM
Meta_table
LEFT JOIN PRDraft_table USING(Reference)
LEFT JOIN NewsCount USING(Reference)
