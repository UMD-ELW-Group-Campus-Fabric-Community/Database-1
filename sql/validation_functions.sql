-- Function: Validate User
CREATE OR REPLACE FUNCTION verify_user(_input VARCHAR(50), _password VARCHAR(50))
RETURNS BOOLEAN 
AS $$
BEGIN

    RETURN EXISTS(
        SELECT * 
        FROM User_Information AS ui
        WHERE ui.username = _input AND ui.user_password = _password
    ) OR
    EXISTS (
        SELECT * 
        FROM User_Information AS ui
        WHERE ui.user_email = _input AND ui.user_password = _password 
    ) OR
    EXISTS (
        SELECT * 
        FROM User_Information AS ui
        WHERE ui.user_phone = _input AND ui.user_password = _password 
    );
END;
$$ LANGUAGE plpgsql;


-- Function: Validate Email Trigger Function
CREATE OR REPLACE FUNCTION validate_email()
RETURNS trigger AS $$
BEGIN
    IF NEW.user_email ~* '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$' THEN
        RETURN NEW;
    ELSE
        RAISE EXCEPTION 'Invalid email address';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Trigger: Validate Email Trigger
CREATE TRIGGER validate_email_trigger
AFTER INSERT OR UPDATE ON User_Information
FOR EACH ROW EXECUTE PROCEDURE validate_email();


-- Function: Validate Phone
CREATE OR REPLACE FUNCTION validate_phone()
RETURNS trigger AS $$
BEGIN
    IF NEW.user_phone ~* '^[0-9]{3}-[0-9]{3}-[0-9]{4}$' THEN
        RETURN NEW;
    ELSE
        RAISE EXCEPTION 'Invalid phone number';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Trigger: Validate Phone For New User
CREATE TRIGGER validate_phone_trigger
BEFORE INSERT OR UPDATE ON User_Information
FOR EACH ROW EXECUTE PROCEDURE validate_phone();