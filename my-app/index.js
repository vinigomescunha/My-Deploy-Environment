var express = require('express');
var app = express();

app.get('/', function (req, res) {
  res.send('Hello World!');
});

app.listen( process.env.PORT || 9000 , function () {
  console.log(`Listening on port ${(process.env.PORT || 9000)}!`);
});
