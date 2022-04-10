const db = require('../services/database.service');

const getAllPrograms = async (req, res, next) => {
    try{
        const result = await db.getProgram();
        if (result.rows.length > 0){
            res.status(200).json({
                status: 200,
                body: result.rows
            });
        }
        res.status(404).json({
            status: 404,
            message: 'Programs not found'
        });
        
    }
    catch(err){
        console.log(err);
        res.status(500).json(err);
    }
}
const getProgram = async (req, res, next) => {
    try{
        const result = await db.getProgram(req.params.id);
        if (result.rows.length > 0){
            res.status(200).json({
                status: 200,
                message: 'Programs found',
                body: result.rows[0]
            });
        }
        res.status(404).json({
            status: 404,
            message: 'Program not found'
        });
    }
    catch(err){
        console.log(err);
        res.status(500).json(err);
    }
}

const getAllArticles = async (req, res, next) => {
    try{
        const result = await db.getArticle();
        if (result.rows.length > 0){
            res.status(200).json({
                status: 200,
                message: 'Articles found',
                body: result.rows                
            });
        }
        res.status(404).json({
            status: 404,
            message: 'Articles not found'
        });
    }  catch(err){
        console.log(err);
        res.status(500).json(err);
    }
}

const getArticle = async (req, res, next) => {
    try{
        const result = await db.getArticle(req.params.id);
        if (result.rows.length > 0){
            console.log(result.rows[0]);
            res.status(200).json({
                status: 200,
                message: 'Article found',
                body: result.rows[0]
            });
        }
        res.status(404).json({
            status: 404,
            message: 'Article not found'
        });
    }
    catch(err){
        console.log(err);
        res.status(500).json(err);
    }
}


module.exports = {
    getAllPrograms,
    getProgram,
    getAllArticles,
    getArticle
};
