# Introductions
This repository holds the code for the PostgreSQL database and API that manages the connections.

The `Dockerfile.db` instantiates a Postgres Database service on a linux opperating system and expose port only to other services within the container, *not to the outside world*.

The `Dockerfile.server` creates a server exposed port #PORT allowing for individuals to connect to the database via api route. Refer to `server/routes/database.route.js` to see the API endpoint and `server/services/database.services.js` to see the querie.

# Getting Started
It is important to understand the difference between `docker-compose.yml` and a `Dockerfile`. A Dockerfile contains the commands that a user would call to create the service whereas Docker Compose is a tool for defining and running multi-container Docker application. 

Dockerfile: 
- Defines a process, starts a server, runs some commands.

Docker Compose:
- Establishes relationship between containers
- Creates/configures connections.
- Imports environment variables

# Configurations and Initilization
Within the *envfiles* directory, there are two files which define environment variables required for the database to configure correctly and for the API to connect to the database. It is recommended that these environment variables are changed when moving into production. 

# Notes
Incorporating this design requires the Servered approach for managing the relational database.

This repository is the basis for the routes outlined in the NextJS fullstack application. The repository for that project can be found under the Community Repository section or [here](https://github.com/UMD-ELW-Group-Campus-Fabric-Community/Website).
