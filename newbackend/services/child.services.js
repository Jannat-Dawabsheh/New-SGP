const ChildModel = require('../model/child.model');

class ChildService {
    static async addChild(userId, childData) {
        try {
            childData.motherUserId = userId;
            const child = await ChildModel.create(childData);
            return child;
        } catch (error) {
            throw error;
        }
    }

    static async deleteChild(childId) {
        try {
            await ChildModel.findByIdAndDelete(childId);
        } catch (error) {
            throw error;
        }
    }

    static async getChildInfo(userId, childId) {
        try {
            const child = await ChildModel.findOne({ motherUserId: userId, _id: childId });
            return child;
        } catch (error) {
            throw error;
        }
    }
}

module.exports = ChildService;
