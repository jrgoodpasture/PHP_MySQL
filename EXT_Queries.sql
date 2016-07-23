# Country Queries

# Search Countries by Population
SELECT *
FROM COUNTRY
WHERE Population < 10000000 and Population > 0;

# Select country names where they speak more than one specified language
	# Just add another lang_name and increase the HAVING statement by one 
    # if you want to add more languages needed
SELECT Country_Name
FROM Country_Language 
WHERE Lang_Name = 'French' or Lang_Name = 'Dutch'
GROUP BY Country_Name
HAVING Count(*) > 1
ORDER BY Country_Name;

# To populate drop down with name of country
SELECT Country_Name
FROM COUNTRY;

-------------------
# City Queries

# Select the cities in a certain country
SELECT Country_Name, City_Name, City_Population
FROM CITY
WHERE Country_Name = 'France';

# Select City by Population
SELECT Country_Name, City_Name, City_Population
FROM CITY
WHERE City_Population < 2500000;

# Search Cities by Score
SELECT Country_Name, City_Name, AVG_Score
FROM AVE_CITY_SCORE
WHERE AVG_Score > 2;

# Select city names where they speak more than one specified language
	# Just add another lang_name and increase the HAVING statement by one 
    # if you want to add more languages needed
SELECT Country_Name, City_Name
FROM City_Language 
WHERE Lang_Name = 'Spanish' or Lang_Name = 'Catalan'
GROUP BY City_Name
HAVING Count(*) > 1
ORDER BY City_Name;

---------------------------------
# Location Queries

# Search Locations by Country
SELECT * 
FROM LOCATION
WHERE Country_Name = 'Spain';

# Search Locations by City
SELECT * 
FROM LOCATION
WHERE City_Name = 'Barcelona';

# Searching Locations by score
SELECT *
FROM AVE_LOCATION_SCORE
WHERE AVG_Score > 2;

# Search by Category
Select *
FROM LOCATION
WHERE Loc_Type = 'Church';

# Search by Category and City
Select *
FROM LOCATION
WHERE Loc_Type = 'Church' AND City_Name = 'Paris';

# Search by Category and Score
Select *
FROM LOCATION NATURAL JOIN AVE_LOCATION_SCORE
WHERE Loc_Type = 'Other' and AVG_Score > 3;

---------------------------------
# Event Queries

# Searching events by country
SELECT *
FROM EVENT
WHERE Country_Name = 'Spain';

# Searching events by city
SELECT *
FROM EVENT
WHERE City_Name = 'Barcelona';

# Searching events by score
SELECT *
FROM AVE_EVENT_SCORE
WHERE AVG_Score > 2;

# Search by Category
Select *
FROM EVENT
WHERE Category = 'Concert';

# Search by Category and City
Select *
FROM EVENT
WHERE Category = 'Concert' AND City_Name = 'Paris';

# Search by Category and Score
Select *
FROM EVENT NATURAL JOIN AVE_EVENT_SCORE
WHERE Category = 'Concert' and AVG_Score > 2;