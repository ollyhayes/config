const { parse } = require ('node-html-parser');
const fs = require('fs');

const bookName = 'example';
let fullBook = '';

for (let i = 1; i < 66; i++) {
// for (let i = 1; i < 2; i++) {
	const html = fs.readFileSync(`./${example}?page=${i}`);
	const root = parse(html)

	fullBook += root.querySelector('.b-story-body-x').text;
	fullBook += '\n';
}

fs.writeFileSync('./full-book.txt', fullBook);