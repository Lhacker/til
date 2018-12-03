const path = require('path');
const fs = require('fs');

const entries = fs.readdirSync('./src/')
  .filter(
    (file) => file.match(/.+\.js$/)
  )
  .map(
    (file) => `./src/${file}` 
  );

console.log(JSON.stringify(entries, null, 4));

module.exports = {
  entry: entries,
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: 'bundle.js'
  }
}
