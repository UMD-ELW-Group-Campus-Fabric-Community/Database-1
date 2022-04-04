-- Create Organization
INSERT INTO Organization (organization_name, organization_website)
VALUES ('Bob', 'www.bob.com');

-- Create User
INSERT INTO User_Information (username, user_password, user_email, user_phone, organization_id, user_level)
VALUES ('admin', 'admin', 'test@bob.com', '1234567890', 1, 'admin');

-- Create Impropper User
-- INSERT INTO User_Information (username, user_password, user_email, user_phone, organization_id, user_level)
-- VALUES ('admin', 'admin', 'not-an-email', '1234567890', 1, 'admin');