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

