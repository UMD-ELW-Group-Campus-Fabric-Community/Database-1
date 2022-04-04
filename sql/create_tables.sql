-- Table: Organization
CREATE TABLE IF NOT EXISTS Organization(
    organization_id SERIAL PRIMARY KEY,
    organization_name VARCHAR(50) NOT NULL,
    organization_website VARCHAR(50) NOT NULL,
    organization_created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    organization_updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Table: User Information
-- Note: That passwords are stored as plain text! 
--       This is a security risk. Do not use this for production.
CREATE TABLE IF NOT EXISTS User_Information(
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    user_password VARCHAR(50) NOT NULL,
    user_email VARCHAR(50) NOT NULL,
    user_phone VARCHAR(50) NOT NULL,
    organization_id INTEGER NOT NULL,
    user_level VARCHAR(50) NOT NULL,
    FOREIGN KEY (organization_id) REFERENCES Organization(organization_id)
);

-- Table: Department
CREATE TABLE IF NOT EXISTS Department(
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL,
    organization_id INTEGER NOT NULL,
    FOREIGN KEY (organization_id) REFERENCES Organization(organization_id)
);

-- Table: Program Information
CREATE TABLE IF NOT EXISTS Program_Information(
    program_id SERIAL PRIMARY KEY,
    program_name VARCHAR(50) NOT NULL,
    program_description VARCHAR(50) NOT NULL,
    program_website VARCHAR(50) NOT NULL,
    program_focus TEXT [] NOT NULL,
    program_created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    program_updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);