const express = require('express');
const bodyParser = require('body-parser');
const app = express();

const port = process.env.HOST_PORT || 8000;

const router = require('./routes/database.route');
const staticPath = '../public';

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.use(express.static(staticPath));
app.use('/api', router);

const server = async () => {
    try {
        app.listen(port, () => {
            console.log(`Server is running on port ${port}`);
        });
    } catch (error) {
        console.log(error);
    }
};
server();