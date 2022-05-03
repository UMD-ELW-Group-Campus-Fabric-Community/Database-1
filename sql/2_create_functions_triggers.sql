CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Function: hash_user_value
CREATE OR REPLACE FUNCTION hash_user_value() 
RETURNS trigger AS $$ 
BEGIN 
    IF NEW._password IS NOT NULL THEN 
        NEW._salt = gen_salt('bf');
        NEW._password = crypt(NEW._password, NEW._salt);
        RETURN NEW;
    END IF;
    RETURN NEW;
-- if no password is set, do nothing
END;
$$ language 'plpgsql';

-- Function: gen_token
CREATE OR REPLACE FUNCTION gen_token() 
RETURNS trigger AS $$ 
BEGIN
    INSERT INTO
        Auth(user_id, token, token_expiry)
    VALUES
        (
            NEW.id,
            gen_random_uuid(),
            NOW() + INTERVAL '1 hour'
        );
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Trigger: hash_user_value
CREATE TRIGGER hash_values 
BEFORE INSERT OR UPDATE ON User_Information 
FOR EACH ROW EXECUTE PROCEDURE hash_user_value();

-- Trigger: gen_token
CREATE TRIGGER gen_token 
AFTER INSERT OR UPDATE ON User_Information
FOR EACH ROW EXECUTE PROCEDURE gen_token();

-- Function: Validate Email Trigger Function
CREATE
OR REPLACE FUNCTION validate_email() 
RETURNS trigger AS $$ 
BEGIN 
    IF NEW.email ~* '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$' THEN RETURN NEW;
    ELSE RAISE EXCEPTION 'Invalid email address';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Trigger: Validate Email Trigger
CREATE TRIGGER validate_email_trigger BEFORE
INSERT
    OR
UPDATE
    ON User_Information FOR EACH ROW EXECUTE PROCEDURE validate_email();

-- Function: Validate Phone
CREATE OR REPLACE FUNCTION validate_phone() 
RETURNS trigger AS $$ 
BEGIN 
    IF NEW.phone ~* '^[0-9]{3}-[0-9]{3}-[0-9]{4}$' THEN RETURN NEW;    
    ELSE RAISE EXCEPTION 'Invalid phone number';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Trigger: Validate Phone For New User
CREATE TRIGGER validate_phone_trigger 
BEFORE INSERT OR UPDATE
ON User_Information FOR EACH ROW EXECUTE PROCEDURE validate_phone();

-- Function: Lookup Organization
CREATE OR REPLACE FUNCTION lookup_organization()
RETURNS trigger AS $$
BEGIN
    IF NEW.department_id IS NULL THEN 
        NEW.department_id = (
          SELECT department_id
          FROM Department
          WHERE department_name LIKE CONCAT('%', NEW.department_name , '%')           
        );
        RETURN NEW;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger: Lookup Organization
CREATE TRIGGER lookup_organization_trigger
BEFORE INSERT OR UPDATE
ON Organization
FOR EACH ROW EXECUTE PROCEDURE lookup_organization();