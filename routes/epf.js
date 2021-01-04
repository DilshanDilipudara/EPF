const express = require('express');
const router = express.Router();



router.get('/viewepf',(req,res)=>{

    let sql = `call viewepf()`;

    db.query(sql,(err,results)=>{
        if(err) {
            console.log(err);
        }
        res.render('pages/viewepf',{data:results[0]});
    });

    
});


router.get('/addepf',(req,res)=>{

    let sql =  `SELECT employeeNumber,CONCAT(firstName,' ',lastName,' - ', employeeNumber)  AS name FROM employees`;

    db.query(sql,(err,results)=>{
        if (err){
            console.log(err);
        }
       // console.log(results);
        res.render('pages/addepf',{employee:results});
    });


});


router.post('/epfaddform',(req,res)=>{
    const obj = JSON.parse(JSON.stringify(req.body)); 
    console.log(obj);
    let employeeNumber = obj.employeeNumber;
    let epfcode = obj.epfcode;
    let salary = obj.salary;
    let date = obj.month;

    let sql = `call addepf(?,?,?,?)`;

    db.query(sql,[employeeNumber,epfcode,salary,date],(err,results)=>{
        if(err) {
            console.log(err);
        }

        let sql = `call viewepf()`;

        db.query(sql,(err,results)=>{
            if(err) {
                console.log(err);
            }
            res.render('pages/viewepf',{data:results[0]});
        });
    });

});

module.exports = router;