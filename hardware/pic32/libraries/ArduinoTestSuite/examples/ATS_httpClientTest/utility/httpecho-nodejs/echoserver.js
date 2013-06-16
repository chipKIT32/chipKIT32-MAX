var http = require('http');
var url = require('url');

process.env.C9_PORT = 8080;

http.createServer(function (req, res) {
  echovalue = JSON.stringify(req.method) + " : " + JSON.stringify(url.parse(req.url)) + "\n";
  res.writeHead(200, {'Content-Type': 'text/plain',
  'Access-Control-Allow-Origin': '*'});
  console.log(echovalue);
  res.end(echovalue);
}).listen(process.env.C9_PORT, "0.0.0.0");
console.log('Server running on port: ' + process.env.C9_PORT);
