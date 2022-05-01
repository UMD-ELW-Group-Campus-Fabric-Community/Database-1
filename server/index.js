const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const app = express();

const port = process.env.HOST_PORT || 8000;

const apiRouter = require('./routes/api.route');
const authRouter = require('./routes/user.route');
const staticPath = '../public';

app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.use(express.static(staticPath));
app.use('/api', apiRouter);

// Handle user authentication and authorization
app.use('/auth', authRouter);

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