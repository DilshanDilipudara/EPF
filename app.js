const express = require('express');
const fileUpload = require('express-fileupload');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const path = require('path');
const app = express();
const { render } = require('ejs');
var office = require('./routes/office')
const port = 3000;
const employee = require('./routes/employee');
const db = mysql.createConnection({
    host: 'jhdjjtqo9w5bzq2t.cbetxkdyhwsb.us-east-1.rds.amazonaws.com',
    user: 'u8il24jxufb4n4ty',
    password: 't5z5jvsyolrqhn9k',
    database: 'm0ky8hn32ov17miq'

});
//create database connection
db.connect((err)=>{
    if(err){
        //throw err;
        console.log(err);
    }
    console.log('connected to database');
});

global.db = db;

app.listen(port,()=>{
    console.log(`Sever runing on port: ${port}`);
});


// configure middleware
app.set('port', process.env.port || port); // set express to use this port
app.set('views', __dirname + '/views'); // set express to look in this folder to render our view
app.set('view engine', 'ejs'); // configure template engine
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json()); // parse form data client
app.use(express.static(path.join(__dirname, 'public'))); // configure express to use public folder
app.use(fileUpload()); // configure fileupload

app.get('/',(req,res)=>{
    res.render('pages/home')
});

//view office
app.get('/viewoffice',office);

//load office add form
app.get('/addoffice',office);

// office add form data
app.post('/addFormOffice',office);

//view employee
app.get('/viewemployee',employee);

// load employee page
app.get('/addemployee',employee);

// employee add form data
app.post('/addFormEmployee',employee);



//delete eployee
app.get('/deleteemployee/:id',employee);

// load employee page
app.get('/updateemployee/:id',employee);

//update employee 
app.post('/updateFormEmployee',employee);

module.exports = app;

