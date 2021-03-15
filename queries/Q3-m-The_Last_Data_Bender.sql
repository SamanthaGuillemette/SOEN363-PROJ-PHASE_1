DO $$
    DECLARE
        tables CURSOR FOR
            SELECT tablename
            FROM pg_tables
            WHERE schemaname = 'public'
            ORDER BY tablename;
        nbRow int=0;
    BEGIN
        FOR table_record IN tables LOOP
                EXECUTE 'CREATE VIEW no_duplicates AS SELECT DISTINCT count(*) FROM '  || table_record.tablename INTO nbRow;
                --way to create separate views for each tables
            END LOOP;
        raise notice 'Value: %', nbRow;
    END$$;