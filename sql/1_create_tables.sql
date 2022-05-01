-- Default Config
SET timezone = 'UTC';

-- Table: Organization
CREATE TABLE IF NOT EXISTS Organization(
    organization_id SERIAL PRIMARY KEY,
    organization_name VARCHAR(200) NOT NULL,
    organization_website VARCHAR(200) NOT NULL,
    organization_created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    organization_updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Table: Privilege
CREATE TABLE IF NOT EXISTS Privilege(
    id SERIAL PRIMARY KEY,
    privilege_name VARCHAR(50) NOT NULL,
    privilege_level VARCHAR(50) NOT NULL
);


-- Table: User
-- Note: That passwords are stored as plain text! 
--       This is a security risk. Do not use this for production.
CREATE TABLE IF NOT EXISTS User_Information(
    id SERIAL PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    phone VARCHAR(50),
    picture VARCHAR(200),
    biography VARCHAR(500),
    _password TEXT NOT NULL,
    _salt TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    organization_id INTEGER NOT NULL,
    privilege_id INTEGER NOT NULL,
    FOREIGN KEY (organization_id) REFERENCES Organization(organization_id),
    FOREIGN KEY (privilege_id) REFERENCES Privilege(id)
);

-- Table: Authentication
CREATE TABLE IF NOT EXISTS Auth(
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    token VARCHAR(50) NOT NULL,
    token_expiry TIMESTAMP NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User_Information(id)
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
    program_description TEXT NOT NULL,
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
    FOREIGN KEY (user_id) REFERENCES User_Information(id)
);
