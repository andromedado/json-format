
var stdinStr = '';

process.stdin.on('data', function (datum) {
  stdinStr += datum;
});

process.stdin.on('end', function () {
  var json;
  try {
    json = JSON.parse(stdinStr);
  } catch (e) {
    process.stderr.write('Unable to parse JSON: ' + e);
    process.exit(1);
  }
  process.stdout.write(JSON.stringify(json, void 0, ' '));
});

process.stdin.resume();

