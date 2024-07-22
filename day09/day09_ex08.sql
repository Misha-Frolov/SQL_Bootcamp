CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE (fib_number BIGINT)
AS $$
DECLARE
    a BIGINT := 0;
    b BIGINT := 1;
    next_fib BIGINT;
BEGIN
    fib_number := 0;
    RETURN NEXT;
    WHILE b < pstop LOOP
        fib_number := b;
        RETURN NEXT;
        next_fib := a + b;
        a := b;
        b := next_fib;
    END LOOP;
END;
$$ LANGUAGE plpgsql;
