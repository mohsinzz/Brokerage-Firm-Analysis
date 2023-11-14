USE bhumioasg;
SELECT zp.*,(SELECT DISTINCT(r.city) from random_data r WHERE r.Zip LIKE zp.Zip) FROM zip_population zp ;

SELECT * FROM random_joined_table;

