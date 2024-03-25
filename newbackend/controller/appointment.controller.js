const AppointmentService = require('../services/appointment.services');

exports.createAppointment = async (req, res, next) => {
    try {
        const { title, date, time, location, childId } = req.body;
        const userId = req.user._id; 
        const appointmentData = { title, date, time, location, motherUserId: userId, childId };
        const appointment = await AppointmentService.createAppointment(appointmentData);
        res.status(201).json({ status: 201, appointment });
        
    } catch (error) {
        console.error(error.message);
        res.status(500).json({ status: 500, message: 'Internal server error' });
        console.error(error)
    }
};

exports.getAppointment = async (req, res, next) => {
    try {
        const appointmentId = req.params.appointmentId;
        const userId = req.user._id; 
        const appointment = await AppointmentService.getAppointment(userId, appointmentId);
        if (!appointment) {
            res.status(404).json({ status: 404, message: 'Appointment not found' });
            return;
        }
        res.status(200).json({ status: 200, appointment });
    } catch (error) {
        console.error(error.message);
        res.status(500).json({ status: 500, message: 'Internal server error' });
    }
};


exports.deleteAppointment = async (req, res, next) => {
    try {
        const appointmentId = req.params.appointmentId;
        const userId = req.user._id; 
        await AppointmentService.deleteAppointment(userId, appointmentId);
        res.status(200).json({ status: 200, message: 'Appointment deleted successfully' });
    } catch (error) {
        console.error(error.message);
        res.status(500).json({ status: 500, message: 'Internal server error' });
    }
};

exports.updateAppointment = async (req, res, next) => {
    try {
        const { title, location, date, time } = req.body;
        const userId = req.user._id;
        const appointmentId = req.params.appointmentId;
        const updateData = {}; 
        if(title) updateData.title = title
        if(location) updateData.location = location
        if(date) updateData.date = date
        if(time) updateData.time = time
        const appointment = await AppointmentService.updateAppointment(userId, appointmentId, updateData);
        res.status(200).json({ status: 200, appointment });
    } catch (error) {
        console.error(error.message);
        res.status(500).json({ status: 500, message: 'Internal server error' });
    }
};

exports.getAllAppointments = async (req, res, next) => {
    try {
        const userId = req.user._id;
        const appointments = await AppointmentService.getAllAppointments(userId);
        res.status(200).json({ status: 200, appointments });
    } catch (error) {
        console.error(error.message);
        res.status(500).json({ status: 500, message: 'Internal server error' });
    }
};
