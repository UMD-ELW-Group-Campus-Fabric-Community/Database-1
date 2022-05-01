
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
        u.id,
        u.firstName,
        u.lastName,
        u.biography,
        u.picture,
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
        ON a.user_id = u.id
    INNER JOIN Organization AS o
        ON u.organization_id = o.organization_id
);

CREATE OR REPLACE VIEW vuser AS (
    SELECT
        u.id,
        u.firstName,
        u.lastName,
        u.biography,
        u.picture,
        u.email,
        u.phone,
        u.created_at
        FROM User_Information u
);


CREATE OR REPLACE VIEW vauth AS (
    SELECT
        a.id,
        a.user_id,
        a.token,
        a.token_expiry,
        u.email,
        u._password,
        u._salt    
    FROM Auth a
    JOIN User_Information u
        ON a.user_id = u.id

);