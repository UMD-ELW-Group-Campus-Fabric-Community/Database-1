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

const getProgram = async (program_name=null) => {
    try{
        if (program_name != null){              
            const sql = `SELECT * FROM vprogram_details WHERE program_name = $1`;
            return await query(sql, [program_name]);  
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

const getArticle = async (article_title=null) => {
    try{
        if (article_title != null){
            const sql = `SELECT * FROM varticles WHERE article_title = $1`;
            return await query(sql, [article_title]);
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