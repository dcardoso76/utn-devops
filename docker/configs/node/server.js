'use strict';

const express = require('express');
let mysql = require('mysql');

// Constants
const PORT = 3000;
const HOST = '0.0.0.0';

let connection = mysql.createConnection({
  host: 'mysql',
  user: 'root',
  password: 'root',
  database: 'devops_app',
  port:3306
});


// App
const app = express();
app.get('/', (req, res) => {
  connection.query("SELECT * FROM welcome", function (err, result) {
    if (err) throw err;
    console.log("Conexion Ok", result);
    res.send(JSON.stringify(result,["id","description"]));
  });
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:8080`);

