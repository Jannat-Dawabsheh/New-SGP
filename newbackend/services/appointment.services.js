const Appointment = require('../model/appointment.model');

exports.createAppointment = async (appointmentData) => {
    try {
        const appointment = await Appointment.create(appointmentData);
        return appointment;

    } catch (error) {
        throw error;
    }
};

exports.getAppointment = async (userId, appointmentId) => {
    try {
        const appointment = await Appointment.findOne({ _id: appointmentId, motherUserId: userId });
        return appointment;
    } catch (error) {
        throw error;
    }
};


exports.deleteAppointment = async (userId, appointmentId) => {
    try {
        await Appointment.findOneAndDelete({ _id: appointmentId, motherUserId: userId });
    } catch (error) {
        throw error;
    }
};

exports.updateAppointment = async (userId, appointmentId, updateData) => {
    try {
        const appointment = await Appointment.findOneAndUpdate(
            { _id: appointmentId, motherUserId: userId },
            updateData,
            { new: true }
        );
        return appointment;
    } catch (error) {
        throw error;
    }
};

exports.getAllAppointments = async (userId) => {
    try {
        const appointments = await Appointment.find({ motherUserId: userId });
        return appointments;
    } catch (error) {
        throw error;
    }
};