const auth = require('../services/auth.service');

const _authenticateToken = async (req, res, next) => {
    try{
        const authHeader = req.headers.authorization;
        const token = authHeader && authHeader.split(' ')[1];
        const id = req.body.id;

        if (token == null || id == null){
            res.status(401).json({
                message: 'Unauthorized'
            });
            return;
        }
        const result = await auth.authenticateToken(
            token,
            id
        );
        if (result.rows.length > 0){
            const expiry = {...result.rows[0]}.token_expiry;
            const now = new Date();
            if (expiry < now){
                res.status(401).json({
                    message: 'Unauthorized'
                });
                return;
            }            
            next();
            return;
        }
        res.status(401).json({
            message: 'Unauthorized'
        });
        return;
    }
    catch(err){
        console.log(err);
        res.status(500).json(err);
        return;
    }
}

const revalidateToken = async (req, res, next) => {
    try{
        const id = req.body.id;
        const result = await auth.revalidateToken(
            id
        );
        if (result.rows.length > 0){
            res.status(200).json({
                status: 200,
                message: 'Token revalidated',
                data: {...result.rows[0]}
            });
            return;
        }
    }
    catch(err){
        console.log(err);
        res.status(500).json(err);
        return;
    }
}

const getUser = async (req, res, next) => {
    try{
        const id = req.body.id;
        const result = await auth.getUser(
            id
        );
        if (result.rows.length > 0){
            res.status(200).json({
                status: 200,
                message: 'User found',
                data: {...result.rows[0]}
            });
            return;
        }
        res.status(404).json({
            status: 404,
            message: 'User not found'
        });
        return;
    }
    catch(err){
        console.log(err);
        res.status(500).json(err);
        return;
    }
}

const login = async (req, res, next) => {
    try{
        const result = await auth.login(
            req.body.email,
            req.body.password
        );
        if (result.rows.length > 0){
            res.status(200).json({
                status: 200,
                message: 'User found',
                body: {...result.rows[0]}
            });
            return;
        }
        res.status(404).json({
            status: 404,
            message: 'User not found'
        });
        return;
    }
    catch(err){
        console.log(err);
        res.status(500).json(err);
        return;
    }
}

const register = async (req, res, next) => {
    try{
        const result = await auth.register(
            req.body.id,
            req.body.firstName,
            req.body.lastName,
            req.body.email,
            req.body.password,
            req.body.organizationId,
            req.body.privilegeId,
        );
        if (result.rows.length > 0){
            res.status(200).json({
                status: 200,
                message: 'User found',
                body: {...result.rows[0]}
            });
            return;
        }
        res.status(404).json({
            status: 404,
            message: 'User not found'
        });
        return;
    }
    catch(err){
        console.log(err);
        res.status(500).json(err);
        return;
    }
}

const update = async (req, res, next) => {
    try{
        const result = await auth.update(
            req.body.username,
            req.body?.password,
            req.body?.firstName,
            req.body?.lastName,
            req.body?.email,
            req.body?.organizationId,
            req.body?.privilegeId,
        );
        if (result.rows.length > 0){
            res.status(200).json({
                status: 200,
                message: 'User found',
                body: {...result.rows[0]}
            });
            return;
        }
        res.status(404).json({
            status: 404,
            message: 'User not found'
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
    _authenticateToken,
    revalidateToken,
    login,
    register,
    update,
    getUser
}