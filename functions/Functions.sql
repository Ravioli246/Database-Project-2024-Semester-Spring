-- Function 1: Get employee_id given a name
CREATE OR REPLACE FUNCTION get_employee_id_by_name(emp_name VARCHAR)
RETURNS INTEGER AS $$
DECLARE
    emp_id INTEGER;
BEGIN
    SELECT employee_id INTO emp_id
    FROM public.employee
    WHERE name = emp_name;
    RETURN emp_id;
END;
$$ LANGUAGE plpgsql;

-- Function 2: Get books by title and date
CREATE OR REPLACE FUNCTION get_books_by_title_and_date(book_title VARCHAR, start_date DATE, end_date DATE)
RETURNS TABLE(book_id BIGINT) AS $$
BEGIN
    RETURN QUERY
    SELECT b.book_id
    FROM public.book b
    JOIN public.upkeep u ON b.book_id = u.book_id
    WHERE b.title = book_title
      AND u.date BETWEEN start_date AND end_date;
END;
$$ LANGUAGE plpgsql;

-- Function 3: Reassign upkeep assignments from one employee to another
CREATE OR REPLACE FUNCTION reassign_upkeep_to_employee(old_emp_name VARCHAR, new_emp_name VARCHAR, start_date DATE, end_date DATE)
RETURNS VOID AS $$
DECLARE
    old_emp_id INTEGER;
    new_emp_id INTEGER;
BEGIN
    -- Get employee IDs
    old_emp_id := get_employee_id_by_name(old_emp_name);
    new_emp_id := get_employee_id_by_name(new_emp_name);

    -- Perform update
    UPDATE public.upkeep
    SET employee_id = new_emp_id
    WHERE employee_id = old_emp_id
      AND date BETWEEN start_date AND end_date;
END;
$$ LANGUAGE plpgsql;

-- Function 4: Get upkeep details by employee name to see all upkeep info
CREATE OR REPLACE FUNCTION get_upkeep_details_by_employee(emp_name VARCHAR, start_date DATE, end_date DATE)
RETURNS TABLE(
    upkeep_id INTEGER,
    book_id BIGINT,
    book_title VARCHAR,
    reason_for_upkeep VARCHAR,
    date DATE
) AS $$
BEGIN
    RETURN QUERY
    SELECT u.upkeep_id, u.book_id, b.title, u.reason_for_upkeep, u.date
    FROM public.upkeep u
    JOIN public.book b ON u.book_id = b.book_id
    JOIN public.employee e ON u.employee_id = e.employee_id
    WHERE e.name = emp_name
      AND u.date BETWEEN start_date AND end_date;
END;
$$ LANGUAGE plpgsql;
