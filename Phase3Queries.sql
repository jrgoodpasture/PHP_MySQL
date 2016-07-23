#Countries that have a population < 1 million
SELECT Country_Name, Population
FROM COUNTRY 
WHERE Population < 1000000;

# Cities that speak Spanish
SELECT City_Name
FROM City_Language
WHERE Lang_Name = 'Spanish';

# Highest rated French speaking city
SELECT City_Name, AVG_Score
FROM CITY_LANGUAGE NATURAL JOIN AVE_CITY_SCORE
WHERE AVG_Score = (SELECT MAX(AVG_Score) FROM CITY_LANGUAGE NATURAL JOIN AVE_CITY_SCORE WHERE Lang_Name = 'French') 
and Lang_Name = 'French';

# Cities in Spain that speak at least one other language other than Spanish
SELECT City_Name, Languages_Spoken
FROM SPANISH_CITIES
WHERE Languages_Spoken > 1;
 
# Lowest rated Location in Barcelona
SELECT *
FROM AVE_LOCATION_SCORE
WHERE City_Name = 'Barcelona' and AVG_Score = (SELECT MIN(AVG_Score) FROM AVE_LOCATION_SCORE WHERE City_Name = 'Barcelona');

# Museums in Madrid
SELECT *
FROM LOCATION
WHERE Loc_Type = 'Museum' and City_Name = 'Madrid';

# Concerts in Barcelona that 0 < cost < 150
SELECT *
FROM EVENT 
WHERE Cost < 150 and Cost > 0 and City_Name = 'Barcelona' and Category = 'Concert';

# Location in Paris organized by category

# This inserted tuple just shows that all the locations are actually grouped by category
# INSERT INTO LOCATION
# VALUE ('France', 'Paris', '115 Disney Way', 'Test', 12, 'Museum', true);

SELECT *
FROM LOCATION
WHERE City_Name = 'Paris'
ORDER BY Loc_Type;

# Highest rated event in Barcelona
SELECT *
FROM AVE_EVENT_SCORE
WHERE City_Name = 'Barcelona' and AVG_Score = (SELECT MAX(AVG_Score) FROM AVE_EVENT_SCORE WHERE City_Name = 'Barcelona');

# Free or student discounted events in Paris
SELECT *
FROM EVENT
WHERE Cost = 0 and City_Name = 'Paris' and Country_Name = 'France'
	UNION
SELECT *
FROM EVENT 
WHERE STD_Discount = true and City_Name = 'Paris' and Country_Name = 'France';

# Cities that speak French outside of France
SELECT City_Name
FROM CITY_LANGUAGE
WHERE Lang_Name = 'French' and Country_Name != 'France';