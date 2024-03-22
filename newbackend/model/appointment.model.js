const mongoose = require('mongoose');

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
        ref: 'Child'
    }
});

const Appointment = mongoose.model('Appointment', appointmentSchema);

module.exports = Appointment;
