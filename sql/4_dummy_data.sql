-- Create Organization
INSERT INTO
    Organization (organization_name, organization_website)
VALUES
    ('Bob', 'www.bob.com');

INSERT INTO
    Organization (organization_name, organization_website)
VALUES
    ('Sally', 'www.sally.com');

-- CREATE PRIVILEGE
INSERT INTO
    Privilege (privilege_name, privilege_level)
VALUES
    ('Admin', 'Admin'),
    ('User', 'User');


-- Create User
INSERT INTO
    User_Information (
        firstName,
        lastName,
        email,
        phone,
        _password,
        picture,
        biography,
        organization_id,
        privilege_id
    )
VALUES
    (
        'Billie',
        'Jean',
        'test@email.com',
        '123-456-7890',
        'test1234',
        'image src',
        'test bio',
        1,
        1
    ),
    (
        'Sally',
        'Jean',
        'test2@email.com',
        '123-456-7890',
        'test1234',
        'image src',
        'test bio',
        2,
        2
    );


-- Create Impropper User
-- INSERT INTO User_Information (username, user_password, user_email, user_phone, organization_id, user_level)
-- VALUES ('admin', 'admin', 'not-an-email', '1234567890', 1, 'admin');
-- Create Department
INSERT INTO
    Department (department_name, organization_id)
VALUES
    ('Department of Information Science', 1);

INSERT INTO
    Department (department_name, organization_id)
VALUES
    ('Department of Computer Science', 2);

-- Create Program_Information
INSERT INTO
    Program_Information (
        program_name,
        program_description,
        program_website,
        program_focus,
        department_id
    )
VALUES
    (
        'iConsultancy Program',
        'The College of Information Studies (iSchool) partners with industry, government, and communities to execute technology-based projects. From analytics to website design, our students tackle these challenges to provide a product you can use.',
        'www.bob.com',
        '{
    "Programming",
    "Math"
}',
        1
    );

INSERT INTO
    Program_Information (
        program_name,
        program_description,
        program_website,
        program_focus,
        department_id
    )
VALUES
    (
        'QUEST Honors Program',
        'QUEST is a selective honors program at the University of Maryland that brings together the top undergraduates in business, engineering, and science to complete team-based, experiential projects.',
        'www.sally.com',
        '{
    "Programming",
    "Math"
}',
        2
    );

-- Create Article
INSERT INTO
    Articles (article_title, article_content, user_id)
VALUES
    (
        'Billie''s Article',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam in nisl venenatis, mattis dui euismod, rutrum enim. Donec ultrices mauris eu neque egestas auctor. Sed sem erat, blandit at ultrices in, feugiat consequat urna. Nulla posuere aliquet mi id vulputate. Nulla in feugiat magna. Fusce suscipit condimentum turpis sed elementum. Pellentesque lorem lectus, iaculis sed ante eu, imperdiet semper mi. In pulvinar varius dui. Mauris pellentesque eleifend dolor ac ultricies. Nulla eu odio tortor. Vestibulum quis mi vulputate, venenatis odio quis, sagittis eros. Suspendisse ac lectus purus. Maecenas condimentum nulla nec dolor interdum imperdiet. Aliquam ornare ut purus at semper. Pellentesque vitae metus eros. Cras vehicula arcu eget odio varius hendrerit.',
        1
    );

INSERT INTO
    Articles (article_title, article_content, user_id)
VALUES
    (
        'Tracy''s Article',
        'Donec maximus quam ut neque rutrum, laoreet congue tortor pellentesque. Sed efficitur augue ac eleifend ornare. Donec commodo et metus quis convallis. Pellentesque sagittis auctor justo, accumsan venenatis erat maximus in. Mauris at fermentum metus, in varius nunc. Suspendisse blandit interdum elit sed consequat. Cras eu aliquet felis, non vestibulum augue. Vestibulum eget interdum tellus. Maecenas mauris sem, viverra non nisl quis, cursus elementum eros. Nunc auctor, velit at dictum varius, leo turpis pharetra tellus, non consequat magna erat luctus quam. Integer ornare nibh non nunc interdum dapibus. Nulla facilisi. Maecenas tincidunt auctor vestibulum.',
        2
    )