ALTER TABLE agent_details
ADD COLUMN conversion_rate INT;

UPDATE  agent_details
SET conversion_rate = ((SELECT COUNT(*) FROM random_joined_table 
						WHERE random_joined_table.agent_name = agent_details.agent_name
                        AND random_joined_table.`status` LIKE 'Sold')/
                        (SELECT COUNT(*) FROM random_joined_table 
						WHERE random_joined_table.agent_name = agent_details.agent_name
                        ))*100;
                        
ALTER TABLE agent_details
ADD COLUMN total_properties INT;

ALTER TABLE agent_details
ADD COLUMN properties_sold INT;

UPDATE agent_details
SET total_properties = (SELECT COUNT(*) FROM random_joined_table
						WHERE random_joined_table.agent_name = agent_details.agent_name);
                        
UPDATE agent_details
SET properties_sold = (SELECT COUNT(*) FROM random_joined_table
						WHERE random_joined_table.agent_name = agent_details.agent_name
                        AND random_joined_table.`status`='Sold');
                        
UPDATE agent_details
SET properties_sold = properties_sold/2 WHERE agent_name= 'Michael Taylor';

UPDATE agent_details
SET total_properties = total_properties/2 WHERE agent_name= 'Michael Taylor';


                        
SELECT * FROM agent_details WHERE agent_name = 'Michael Taylor';