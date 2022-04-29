const db = require('../services/database.service');

const getProgram = async (req, res, next) => {
    try{
        const result = await db.getProgram(
            req.params.program_name?req.params.program_name:null
        );
        if (result.rows.length > 0){
            res.status(200).json({
                status: 200,
                message: 'Programs found',
                body: result.rows
            });
            return;
        }
        res.status(404).json({
            status: 404,
            message: 'Program not found'
        });
        return;
    }
    catch(err){
        console.log(err);
        res.status(500).json(err);
        return;
    }
}

const getArticle = async (req, res, next) => {
    try{
        const result = await db.getArticle(
            req.params.article_title?req.params.article_title:null
        );
        if (result.rows.length > 0){
            res.status(200).json({
                status: 200,
                message: 'Article found',
                body: result.rows
            });
            return;
        }
        res.status(404).json({
            status: 404,
            message: 'Article not found'
        });
        return;
    }
    catch(err){
        console.log(err);
        res.status(500).json(err);
        return;
    }
}

module.exports = {
    getProgram,
    getArticle
};
