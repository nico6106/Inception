var http = require('http');
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello World\n');
}).listen(1111, '127.0.0.1');
console.log('Server running at https://nlesage.42.fr/nico.html');
