var fs = require('fs');



fs.writeFileSync("message.txt", "Hello, NodeJs");
 
fs.appendFile("message.txt", "\nHello, User!", function(error){
                
                var data = fs.readFileSync("message.txt", "utf8");
                console.log(data);  
});

var nodemailer = require('nodemailer');

var transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: 'yashkin.rostyslav99@gmail.com',
    pass: 'УбралСвойПароль'
  }
});

var mailOptions = {
  from: 'yashkin.rostyslav99@gmail.com',
  to: 'yashkin.rostyslav99@gmail.com',
  subject: 'Sending Email using Node.js',
  text: 'That was easy!'
};

transporter.sendMail(mailOptions, function(error, info){
  if (error) {
    console.log(error);
  } else {
    console.log('Email sent: ' + info.response);
  }
}); 