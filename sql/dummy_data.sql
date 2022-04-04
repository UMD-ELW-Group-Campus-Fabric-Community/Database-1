-- Create Organization
INSERT INTO Organization (organization_name, organization_website)
VALUES ('Bob', 'www.bob.com');

-- Create User
INSERT INTO User_Information (username, user_password, user_email, user_phone, organization_id, user_level)
VALUES ('admin', 'admin', 'test@bob.com', '1234567890', 1, 'admin');

-- Create Impropper User
-- INSERT INTO User_Information (username, user_password, user_email, user_phone, organization_id, user_level)
-- VALUES ('admin', 'admin', 'not-an-email', '1234567890', 1, 'admin');

-- Create Department
INSERT INTO Department (department_name, organization_id)
VALUES ('Bob', 1);

-- Create Program_Information
INSERT INTO Program_Information (program_name, program_description, program_website, program_focus, organization_id)
VALUES ('Bob', 'Bob', 'www.bob.com', '{
    "Programming",
    "Math"
}', 1);
