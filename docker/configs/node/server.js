'use strict';

const express = require('express');
let mysql = require('mysql');

// Constants
const PORT = 3000;
const HOST = '0.0.0.0';

let connection = mysql.createConnection({
  host: 'utn-devops.localhost',
  user: 'root',
  password: 'root',
  database: 'devops_app'
});

// App
const app = express();
app.get('/', (req, res) => {
  res.send('Hello World');
  console.log("Conexion OK")
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);