ALTER TABLE random_data 
ADD FOREIGN KEY (Zip) REFERENCES zip_population(ZiP);

ALTER TABLE random_data 
ADD FOREIGN KEY (agent_name) REFERENCES agent_details(agent_name);


SELECT COUNT(DISTINCT(agent_name)) FROM random_data;

ALTER TABLE random_data
RENAME COLUMN home_sub_type TO home_div_type;

SELECT * FROM random_data;

SELECT COUNT(*) FROM random_data 
WHERE home_div_type LIKE '';

SELECT COUNT(*) FROM random_data 
WHERE `home_sub_type_[0]` IS NULL;

ALTER TABLE random_data
DROP COLUMN `home_sub_type_[0]`;

SELECT * FROM random_data;

SELECT home_div_type,COUNT(*) FROM random_data 
GROUP BY home_div_type;

SELECT city,home_div_type,count(*) FROM random_data 
GROUP BY city,home_div_type
ORDER BY city,home_div_type,count(*) DESC;

SELECT agent_name,home_div_type,count(*) FROM random_data 
GROUP BY agent_name,home_div_type
ORDER BY agent_name,home_div_type,count(*) DESC;

#if we see home_div_type has 20% missing values and all the other categories are dispersed evenly.
#So we cannot afford to replace the missing values of this column with the mode of the column.
# Nor we can remove the 20% of the rows from the Data.
# So we keep the null values in the home_div_type column as it is.

SELECT * FROM random_data WHERE agent_name LIKE 'Michael Taylor';


