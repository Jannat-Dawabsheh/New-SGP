const jwt = require('jsonwebtoken');

const authenticate = async (req, res, next) => {
    const token = req.headers.authorization;

    if (!token) {
        return res.status(401).json({ status: 401, message: 'Unauthorized' });
    }

    try {
        const decoded = jwt.verify(token, 'secretKey');
        req.user = decoded;
        
        next();
    } catch (error) {
        return res.status(403).json({ status: 403, message: 'Invalid token' });
    }
};

module.exports = { authenticate };
