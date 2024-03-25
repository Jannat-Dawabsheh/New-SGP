const mongoose = require('mongoose');
const db = require('../config/db');

const appointmentSchema = new mongoose.Schema({
    title: {
        type: String,
        required: true
    },
    date: {
        type: Date,
        required: true
    },
    time: {
        type: String,
        required: true
    },
    location: {
        type: String,
        required: true
    },
    motherUserId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User', 
        required: true
    },
    childId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Child',
        required: true
    }
});

appointmentSchema.statics.updateAppointment = async function (appointmentId, updateData) {
    try {
        const appointment = await this.findByIdAndUpdate(appointmentId, updateData, { new: true });
        return appointment;
    } catch (error) {
        throw error;
    }
};

const Appointment = db.model('Appointment', appointmentSchema);

module.exports = Appointment;
