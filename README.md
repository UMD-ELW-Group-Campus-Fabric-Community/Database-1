# Database
This is a PostgreSQL databased used to model the backend process for the website. 

The `Dockerfile.db` instantiates a Postgres Database service on a linux opperating system and expose port #PORT only to other services within the container, *not to the outside world*.

The `Dockerfile.server` creates a server exposed port #PORT allowing for individuals to connect to the database via api route. Refer to `server/routes/database.route.js` to see the API endpoint and `server/services/database.services.js` to see the querie.

## Notes
Incorporating this design requires the Servered approach for managing the relational database.

This repository is the basis for the routes outlined in the NextJS fullstack application. The repository for that project can be found under the Community Repository section or [here](https://github.com/UMD-ELW-Group-Campus-Fabric-Community/Website).
