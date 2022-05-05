const api = require('../services/api.service');

const getProgram = async (req, res, next) => {
    try{
        const result = await api.fetchProgram(
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
        const result = await api.fetchArticle(
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

const postInquiry = async (req, res, next) => {
    try{
        const result = await api.postInquiry(
            req.body.fname,
            req.body.lname,
            req.body.email,
            req.body.name,
            req.body.message,
            req.body?.webiste,
            req.body?.budget,
            req.body?.phone,
            req.body?.poi,
            req.body?.timeframe,
        );
        res.status(200).json({
            status: 200,
            message: 'Inquiry submitted'
        });
        return;
    } catch(err){
        console.log(err);
        res.status(500).json(err);
        return;
    }
}

module.exports = {
    getProgram,
    getArticle,
    postInquiry
};
