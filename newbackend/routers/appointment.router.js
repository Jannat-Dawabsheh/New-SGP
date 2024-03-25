const express = require('express');
const router = express.Router();
const AppointmentController = require('../controller/appointment.controller');
const { authenticate } = require("../middleware/auth.middleware");


router.post('/', authenticate, AppointmentController.createAppointment);
router.get('/:appointmentId', authenticate, AppointmentController.getAppointment);
router.delete('/:appointmentId', authenticate, AppointmentController.deleteAppointment);
router.put('/:appointmentId', authenticate, AppointmentController.updateAppointment);
router.get('/', authenticate, AppointmentController.getAllAppointments); 

module.exports = router;
