const  { Pool } = require('pg');
const config = require('../config/config');
const pool = new Pool(config);

const query = (sql, params) => {    
    return new Promise((resolve, reject) => {
        return pool
            .connect()
            .then(client => {
                client
                    .query(sql, params)
                    .then(result => {
                        client.release();
                        resolve(result);
                    })
                    .catch(err => {
                        client.release();
                        reject(err);
                    })
                }
            )
    })
};

module.exports = {
    query
};