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
    user_fname VARCHAR(50) NOT NULL,
    user_lname VARCHAR(50) NOT NULL,
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
    program_updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    department_id INTEGER NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

-- Table: Article
CREATE TABLE IF NOT EXISTS Articles(
    article_id SERIAL PRIMARY KEY,
    article_title VARCHAR(50) NOT NULL,
    article_content TEXT NOT NULL,
    article_created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    article_updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    user_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User_Information(user_id)
);

-- View: Program Info
CREATE OR REPLACE VIEW vprogram_details AS(
    SELECT
        pri.program_id,
        pri.program_name,
        pri.program_description,
        pri.program_website,
        pri.program_focus,
        d.department_id,
        d.department_name,
        o.organization_id,
        o.organization_name,
        o.organization_website
    FROM
        Program_Information AS pri 
    INNER JOIN
        Department AS d
        ON pri.department_id = d.department_id
    INNER JOIN
        Organization AS o
        ON o.organization_id = d.organization_id
);

-- Views: View Articles
CREATE OR REPLACE VIEW varticles AS (
    SELECT 
        u.user_id,
        u.user_fname,
        u.user_lname,
        a.article_id,
        a.article_title,
        a.article_content,
        a.article_created_at,
        a.article_updated_at,
        o.organization_id,
        o.organization_name,
        o.organization_website
    FROM Articles AS a
    INNER JOIN User_Information AS u
        ON a.user_id = u.user_id
    INNER JOIN Organization AS o
        ON u.organization_id = o.organization_id
);