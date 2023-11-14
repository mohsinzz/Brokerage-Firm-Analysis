CREATE TABLE random_joined_table AS 
SELECT c2.*,ac.comission_in_percentage 
FROM (SELECT c1.*,a.`Brokerage Firm` FROM 
		(SELECT r.*,z.population FROM random_data r LEFT JOIN zip_population z 
			ON r.Zip = z.Zip) c1 LEFT JOIN agent_details a
		ON c1.agent_name=a.agent_name) c2 LEFT JOIN agent_commission ac 
ON c2.home_div_type = ac.home_sub_type;

UPDATE random_joined_table
SET comission_in_percentage = 5 WHERE comission_in_percentage is NULL;

SELECT * FROM random_joined_table;

ALTER TABLE random_joined_table
ADD COLUMN days_required_to_sell INT;

UPDATE random_joined_table
SET `sold _date` = DATE_FORMAT(STR_TO_DATE(`sold _date`, '%d-%m-%Y'), '%Y-%m-%d');

UPDATE random_joined_table
SET `listing _date` = DATE_FORMAT(STR_TO_DATE(`listing _date`, '%d-%m-%Y'), '%Y-%m-%d');


UPDATE random_joined_table
SET days_required_to_sell= ABS(DATEDIFF(`sold _date`, `listing _date`));

ALTER TABLE random_joined_table
ADD COLUMN commission_in_amount INT;

UPDATE random_joined_table
SET commission_in_amount = CASE
	WHEN `status` LIKE 'Sold' THEN (comission_in_percentage*sold_price)/100 
    ELSE 0
    END;

ALTER TABLE random_joined_table
RENAME COLUMN comission_in_percentage TO commission_in_percentage;

SELECT count(*) FROM random_joined_table WHERE agent_name LIKE 'Michael Taylor';

SELECT * INTO OUTFILE 'final_table.csv'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM random_joined_table;



