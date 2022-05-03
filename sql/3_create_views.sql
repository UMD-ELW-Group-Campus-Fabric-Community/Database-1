
-- View: Program Info
CREATE OR REPLACE VIEW vprogram_details AS(
    SELECT
        pri.*,
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
        ON o.department_id = d.department_id
);

-- Views: View Articles
CREATE OR REPLACE VIEW varticles AS (
    SELECT 
        a.*,
        o.organization_name,
        o.organization_website
    FROM Articles AS a
    INNER JOIN Organization AS o
        ON a.organization_id = o.organization_id
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