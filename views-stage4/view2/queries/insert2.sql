-- Add a new book to update that the publsiher is from samoa, and a new country should appear in our view.
INSERT INTO public.upkeep (upkeep_id, id, employee_id, tools_used, reason_for_upkeep, date)
VALUES (123456, 1, 1030, 'Brush', 'Dust accumulation', CURRENT_DATE);
