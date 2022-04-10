const  { Pool } = require('pg');
const config = require('../config/config');
const pool = new Pool(config);
await pool.connect();


const query = async(sql, params) => {
    return new Promise((resolve, reject) => {
        pool.query(sql, params, (err, res) => {
            if (err) {
                reject(err);
            }
            resolve(res);
        });
    });
}

const getProgram = async (id=null) => {
    try{
        if (id != null){              
            const sql = `SELECT * FROM vprogram_details WHERE program_id = $1`;
            return await query(sql, [id]);  
        }
        const sql = `SELECT * FROM vprogram_details`;
        return await query(sql);
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
        return await query(sql);
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