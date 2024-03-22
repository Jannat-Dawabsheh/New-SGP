const mongoose = require('mongoose');
const db = require('../config/db');

const {Schema} = mongoose;

const childSchema = new Schema({
    motherUserId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required: true
    },
    name: {
        type: String,
        required: true
    },
    dateOfBirth: {
        type: Date,
        required: true
    },
    gender: {
        type: String,
        enum: ['male', 'female'],
        required: true
    }
});

const ChildModel = db.model('Child', childSchema);

module.exports = ChildModel;
