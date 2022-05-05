-- Create Department
INSERT INTO
    Department (department_name)
VALUES
    ('Department of Information Science'),
    ('Robert H. Smith School of Business');

-- Create Organization
INSERT INTO
    Organization (
        organization_name,
        organization_website,
        department_name
    )
VALUES
    (
        'iConsultancy',
        'https://ischool.umd.edu/partners/iconsultancy/',
        'Information Science'
    ),
    (
        'QUEST Honors program',
        'https://www.rhsmith.umd.edu/quest',
        'Robert H.'
    );

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
-- Create Program_Information
INSERT INTO
    Program_Information (
        program_name,
        program_description,
        program_website,
        program_focus,
        program_image,
        department_id
    )
VALUES
    (
        'iConsultancy Program',
        'The iConsultancy at the University of Maryland’s top-ranked College of Information Studies partners with public and private sector organizations and businesses to solve your information challenges. We work with your organization to clearly define and scope your information-based projects and, with our talented pool of undergraduate and graduate students, fulfill your project goals while providing our students with invaluable real-world experience.',
        'https://ischool.umd.edu/partners/iconsultancy/',
        '{
            {
                "title": "UX/UI Design",
                "src": "/icons/website.png"
            },
            {
                "title": "Web Development",
                "src": "/icons/website.png"
            },
            {
                "title": "Data Science",
                "src": "/icons/analysis.png"
            },
            {
                "title": "Data Visualization",
                "src": "/icons/design.png"
            },
            {
                "title": "Info Management",
                "src": "/icons/info.png"
            },
            {
                "title": "Database and Tech",
                "src": "/icons/database.png"
            }
        }',
        '/img/programs/iconsultancy/default.jpg',
        1
    ),
    (
        'QUEST Honors Program',
        'QUEST is a selective honors program at the University of Maryland that brings together the top undergraduates in business, engineering, and science to complete team-based, experiential projects.',
        'https://www.rhsmith.umd.edu/quest',
        '{
        {
            "title": "Systems Design & Analysis",
            "src": "/icons/database.png"
        },
        {
            "title": "Business Analysis",
            "src": "/icons/analysis.png"
        }
        }',
        '/img/programs/quest/default.jpg',
        2
    );

-- Create Article
INSERT INTO
    Articles (
        article_title,
        article_picture,
        article_content,
        author,
        author_bio,
        organization_id
    )
VALUES
    (
        'In Hospital Project, QUEST Students Prescribe Changes',
        'https://www.rhsmith.umd.edu/sites/default/files/news/featured/2021/05/quest_hospital_project.png',
        'A virtual trip to the doctor''s office was quite productive for these Maryland Smith students.

This past semester, a team of four QUEST Honors Program students worked with Children''s National Hospital in Washington, D.C., to provide recommendations toward improving the patient experience, reducing provider burnout, making providers more productive, and increasing the hospital''s bottom line.

Tawanza Hassan, a Maryland Smith EMBA from Children''s National, served as project champion. And Maryland Smith''s Michelle Dugas served as faculty adviser.

“This entire project was incredibly rewarding, especially because it was something we knew we wanted to do at the beginning of the semester after listening to all of the projects and the various opportunities presented,” says Drew Levine, a Maryland Smith finance and information systems student who participated in the project. “I think the problem in itself and the nature of the problem with patient wait time is something that''s understood by a majority of people who participate in healthcare in some way, and we knew we could help.”

Open to students in the A. James Clark School of Engineering, the College of Computer, Mathematical, and Natural Sciences, and the Robert H. Smith School of Business, QUEST is a highly regarded, highly selective program in which students work together in each course through multidisciplinary teams.

“QUEST''s experiential learning projects offer students an opportunity to tackle ambiguous, real-world problems with no clear solution. Through collaborating with peers from various academic backgrounds, they are able to make a measurable impact on organizations while learning important teamwork, communication, and problem-solving skills,” says QUEST Assistant Director Jessica Roffe.

Levine''s teammates Priscilla Lee, Alvina Pan and Lydia Hu, who study bioengineering, cell biology and computer science, respectively, brought valuable perspectives and some outside knowledge of the healthcare industry prior to the project.

“Being a Smith student and my other team members having science backgrounds definitely made for a better project overall,” says Levine. “Where I could help tackle problems from a financial and information systems perspective, they could approach them from different angles.”

Over the course of the semester, the team conducted interviews with hospital staff members, C-suite directors, operations managers, physicians and nurses to obtain a broad scope of viewpoints from within the organization.

The students, understanding that improving the patient experience was at the project''s core, also administered patient surveys that measured satisfaction metrics and provided anecdotal evidence, Levine says.

Having input from the hospital''s various departments and stakeholders was a major piece to the puzzle, Levine says.

“Being able to do these interviews and conduct surveys was brilliant because not only did we gain their unique perspectives, but we also built relationships with many of the staff members,” he says. “They were all incredibly helpful and we felt like they were investing in our success.”

In previous years, capstone teams have used on-site visits to glean information for their projects. However, with pandemic-related restrictions, the team did its best to work within the new guidelines, relying more heavily on patient and staff interviews, conducted remotely.

“Missing out on the chance to interact with the staff and clients in-person to better understand the environment we were operating in was something that we were upset we couldn''t do,” says Levine. “But we were able to make the most of our experience.”

The team''s success was the culmination of effort from every one of its members and also thanks to the assistance of advisors and participants throughout the process, Levine says. It was gratifying to know that they helped make a difference, he says.

“I can''t stress enough how much of a group effort this was and how the camaraderie between the team and our advisors made this such a successful project,” Levine says.

“I''m very fortunate that I got to work with such incredible people and I think it''s definitely reflected in our overall outcome.”',
        'Greg Muraski',
        'The Robert H. Smith School of Business is an internationally recognized leader in management education and research. One of 12 colleges and schools at the University of Maryland, College Park, the Smith School offers undergraduate, full-time and part-time MBA, executive MBA, online MBA, specialty master''s, PhD and executive education programs, as well as outreach services to the corporate community. The school offers its degree, custom and certification programs in learning locations in North America and Asia.',
        2
    );
