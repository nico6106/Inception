var http = require('http');
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello World\n');
}).listen(1111, '127.0.0.1');
console.log('Server running at https://static.website.42.fr/');
