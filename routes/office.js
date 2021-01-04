const { query } = require('express');
var express = require('express');
const router = express.Router();

function getoffice(req,res){
    let sql = `call getoffices()`;
    
    db.query(sql,true,(err,results)=>{
        if(err) throw err;
        console.log(results);
        res.render('pages/viewoffice',{data:results[0]});
        
    });
}

// veiw all office
router.get('/viewoffice',getoffice);

//add office page load
router.get('/addoffice',(req,res)=>{
    res.render('pages/addoffice')
});

//form data add office
router.post('/addFormOffice',(req,res)=>{
    console.log(req.body);
    let officeCode = req.body.officeCode;
    let officeName = req.body.officeName;
    let city = req.body.city;
    let phone = req.body.phonenumber;
    let addressLine1 = req.body.addressLine1;
    let addressLine2 = req.body.addressLine2;
    let street = req.body.street;
    let country = req.body.country;
    let postalCode = req.body.postalcode;

    let sql = `call addoffice(?,?,?,?,?,?,?,?,?)`

    db.query(sql,[officeCode,officeName,city,phone,addressLine1,addressLine2,street,country,postalCode],(err,results)=>{
        if(err) throw err;

        let sql = `call getoffices()`;
    
            db.query(sql,true,(err,results)=>{
                if(err) throw err;
                console.log(results);
                res.render('pages/viewoffice',{data:results[0]});
                
            });
    });
});


module.exports = router;
