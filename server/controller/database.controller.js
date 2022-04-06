const db = require('../services/database.service');



const getAllPrograms = async (req, res, next) => {
    try{
        const result = await db.getProgram();
        res.status(200).json(result);
    }
    catch(err){
        console.log(err);
        res.status(500).json(err);
    }
}
const getProgram = async (req, res, next) => {
    try{
        const result = await db.getProgram(req.params.id);
        res.status(200).json(result);
    }
    catch(err){
        console.log(err);
        res.status(500).json(err);
    }
}

const getAllArticles = async (req, res, next) => {
    try{
        const result = await db.getArticle();
        res.status(200).json(result);
    }  catch(err){
        console.log(err);
        res.status(500).json(err);
    }
}

const getArticle = async (req, res, next) => {
    try{
        const result = await db.getArticle(req.params.id);
        res.status(200).json(result);
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
