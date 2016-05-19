DROP FUNCTION IF EXISTS create_machine;
DROP FUNCTION IF EXISTS change_machine_name;
DROP FUNCTION IF EXISTS delete_machine;

delimiter $$

CREATE FUNCTION create_machine(aid varchar(30)) RETURNS int
    BEGIN
        INSERT INTO machine (machine_name) VALUES('new machine');
        INSERT INTO owns VALUES(aid, LAST_INSERT_ID());
        RETURN 1;
    END$$

CREATE FUNCTION change_machine_name(mid int, mname varchar(20)) RETURNS int
    BEGIN
        UPDATE machine SET machine_name=mname WHERE machine_id=mid;
        RETURN 1;
    END$$

CREATE FUNCTION delete_machine(mid int) RETURNS int
    BEGIN
        DELETE FROM owns WHERE machine_id=mid;
        DELETE FROM refers WHERE machine_id=mid;
        DELETE FROM machine WHERE machine_id=mid;
        RETURN 1;
    END$$

delimiter ;
