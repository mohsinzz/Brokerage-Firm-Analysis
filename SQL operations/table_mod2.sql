CREATE TEMPORARY TABLE zip_pop_temp AS
SELECT Zip, MAX(population) AS max_pop FROM zip_population 
GROUP BY Zip;

DELETE FROM zip_population
WHERE (zip,population) NOT IN (SELECT * FROM zip_pop_temp);

select count(Zip) from zip_population;

ALTER TABLE zip_population
ADD PRIMARY KEY (Zip);