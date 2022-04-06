const  { Client } = require('pg');
const config = require('../config/config');


const query = async(sql, params) => {
    try{
        const client = new Client(config);
        const connection = await client.connect();
        const result = await client.query(sql, params);
        
        return result.rows;
    }
    catch(err){
        console.log(err);
        return err;
    }
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