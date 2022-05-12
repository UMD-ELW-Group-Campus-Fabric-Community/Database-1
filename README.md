# Introductions
This repository holds the code for the PostgreSQL database and API that manages the connections.

The `Dockerfile.db` instantiates a Postgres Database service on a linux opperating system and expose port only to other services within the container, *not to the outside world*.

The `Dockerfile.server` creates a server exposed port #PORT allowing for individuals to connect to the database via api route. Refer to `server/routes/database.route.js` to see the API endpoint and `server/services/database.services.js` to see the querie.

# Getting Started
It is important to understand the difference between `docker-compose.yml` and a `Dockerfile`. A Dockerfile contains the commands that a user would call to create the service whereas Docker Compose is a tool for defining and running multi-container Docker application. 

### Dockerfile: 
- Defines a process, starts a server, runs some commands.

### Docker Compose:
- Establishes relationship between containers
- Creates/configures connections.
- Imports environment variables

# Configurations and Initilization
Within the *envfiles* directory, there are two files which define environment variables required for the database to configure correctly and for the API to connect to the database. It is recommended that these environment variables are changed when moving into production. 

In this parent directory, you will see a sub-directory called `sql/`. The `docker-compose` file is configured to take any sql files within this directory and execute them on initilization (note: they are execute in order, hence the numbers).

# Server (API)

The server file is broken into individual segments (e.g., controller, routes, services) that control individual functions. 

### Controller
The controller controls how parameters from the request are used to interact with the service. If the required parameters are not provided or the database does not have the information, an error is thrown. For instance, the database controller utilizes pre-written SQL and parameterizes information provided in the request body.

### Routes
The routes handles how individuals are entering the API. If a given protocal is not supported or the required URL parameters are not provided, an invalid request error will be triggered by default.

### Services
The services describe the resources available. For instance, the database service pools a connection allowing for multiple clients (or a single client) to connect and queries the sql provided.

# Manually Adding Data

If data cannot be added during the initialization state of the database, there's also the option of directly connecting to the Postgres DB through the SSH connection. The following code block demonstrates on adding a new record to a given table in the database using the bash terminal (this option is available to all environments).

```bash
# SSH into the AWS EC2 Instance
ssh -i cert.pem ubuntu@3.215.148.52
# Connect to the Postgres DB Container
psql -U[user name] [database]
```
```sql
-- Add a new article
INSERT INTO Articles (
    article_title, 
    article_picture, 
    article_content,
    author,
    author_bio,
    author_img,
    organization_id
) VALUES (
    'some article title',
    'url:picture',
    'some article text',
    'John Smith',
    'An iSchool studenet...',
    'url:picture',
    1
);
```
Note: The change in code blocks illustrates a change in terminal support. Once connected to the Postgres DB, regular terminal commands will no longer work.

# Notes
Incorporating this design requires the Servered approach for managing the relational database.

This repository is the basis for the routes outlined in the NextJS fullstack application. The repository for that project can be found under the Community Repository section or [here](https://github.com/UMD-ELW-Group-Campus-Fabric-Community/Website).

# File Structure Breakdown
```
database
  dockerfiles (individual docker files)
  envfiles (configuration files for docker container)
  server (route, controller, and db connection manager)
  sql (sql ran on startup)
  docker-compose.yml (docker deployment)
  
  ```