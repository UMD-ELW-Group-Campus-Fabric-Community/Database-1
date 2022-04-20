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

const getProgram = async (id=null) => {
    try{
        if (id != null){              
            const sql = `SELECT * FROM vprogram_details WHERE program_id = $1`;
            return await query(sql, [id]);  
        }
        const sql = `SELECT * FROM vprogram_details`;
        const res = await query(sql);
        return res;
    }
    catch(err){ 
        console.log(err);
        return err;
    }
}

const getArticle = async (id=null) => {
    try{
        if (id != null){
            const sql = `SELECT * FROM varticles WHERE article_id = $1`;
            return await query(sql, [id]);
        }
        const sql = `SELECT * FROM varticles`;
        const res = await query(sql);
        return res;
    }
    catch(err){
        console.log(err);   
        return err;
    }   
}

module.exports = {
    getProgram,
    getArticle
};