const { query } = require('./database.service');

const fetchProgram = async (program_name=null) => {
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

const fetchArticle = async (article_title=null) => {
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
    fetchProgram,
    fetchArticle
}