const express = require('express');
const body_parser = require('body-parser');
const userRouter = require('./routers/user.router');
const childRouter = require('./routers/child.router');
const appointmentRouter = require('./routers/appointment.router');

const app = express();

app.use(body_parser.json());

app.use('/user',userRouter);
app.use('/child', childRouter); 
app.use('/appointment', appointmentRouter); 
module.exports = app;