const db = {
    host:       process.env.DB_HOST,
    port:       process.env.DB_PORT,
    user:       process.env.DB_USER,
    password:   process.env.DB_PASS,
    database:   process.env.DB_NAME,

    /*
        Pool Configurations

        // Number of milliseconds before a connection is closed due to inactivity.
            idleTimeoutMillis?: number;

        // Number of milliseconds before a request for a connection times out.
            connectionTimeoutMillis?: number;
    */
    idleTimeoutMillis: 5000,
    connectionTimeoutMillis: 10000
}
module.exports = db;