const ChildService = require("../services/child.services");

exports.addChild = async (req, res, next) => {
    try {
        const { name, dateOfBirth, gender } = req.body;
        const userId = req.user._id;
        const child = await ChildService.addChild(userId, { name, dateOfBirth, gender });
        res.status(200).json({ status: 200, child });
    } catch (error) {
        console.error(error.message);
        res.status(500).json({ status: 500, message: 'Internal server error' });
    }
};

exports.deleteChild = async (req, res, next) => {
    try {
        const childId = req.params.childId;
        await ChildService.deleteChild(childId);
        res.status(200).json({ status: 200, message: 'Child deleted successfully' });
    } catch (error) {
        console.error(error.message);
        res.status(500).json({ status: 500, message: 'Internal server error' });
    }
};

exports.getChildInfo = async (req, res, next) => {
    try {
        const userId = req.user._id;
        const childId = req.params.childId;
        const child = await ChildService.getChildInfo(userId, childId);
        if (!child) {
            res.status(404).json({ status: 404, message: 'Child not found' });
            return;
        }
        res.status(200).json({ status: 200, child });
    } catch (error) {
        console.error(error.message);
        res.status(500).json({ status: 500, message: 'Internal server error' });
    }
};
