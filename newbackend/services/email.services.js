const nodemailer = require('nodemailer');

class EmailService {
    static async sendEmail(to, subject, text) {
     
        const transporter = nodemailer.createTransport({
         
            service: 'Gmail',
            auth: {
                user: 'dalia.2001.kh@gmail.com',
                pass: 'rynn zlsq tsvo xolx'
            }
        });

        // Send email
        const mailOptions = {
            from: 'dalia.2001.kh@gmail.com',
            to,
            subject,
            text
        };

        try {
            const info = await transporter.sendMail(mailOptions);
            console.log('Email sent: ' + info.response);
            return true;
        } catch (error) {
            console.error('Error sending email:', error);
            return false;
        }
    }
}

module.exports = EmailService;
