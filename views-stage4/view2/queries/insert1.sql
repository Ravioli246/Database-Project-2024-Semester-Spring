-- Insert into the underlying table of the veiw another entry. It will automatically update and appear in the view
INSERT INTO upkeep (upkeep_id, id, employee_id, tools_used, reason_for_upkeep, date)
VALUES ( 12312 ,2141, 1003, 'Brush', 'Dust accumulation',CURRENT_DATE);   
