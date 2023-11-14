SELECT * FROM agent_details a 
WHERE (SELECT COUNT(a1.agent_name) FROM agent_details a1 WHERE a.agent_name=a1.agent_name)>1;

#There are two agents with the same name ('Michael Taylor') but are from different brokerage firms.

ALTER TABLE agent_details
ADD agent_sr_no INT AUTO_INCREMENT PRIMARY KEY;