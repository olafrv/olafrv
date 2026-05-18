import { writeFile } from 'fs/promises';
import slides from './slides.js';

const GITHUB_RAW_BASE = 'https://raw.githubusercontent.com/olafrv/olafrv/main/slides';
const outputFile = '../public/blog/articles.json';

const articles = slides.map((slide, index) => ({
  id: index + 1,
  title: slide.title,
  language: slide.language,
  img: slide.img,
  pdf_url: `${GITHUB_RAW_BASE}/${slide.filename}`,
}));

await writeFile(outputFile, JSON.stringify(articles, null, 2));
console.log(`Written ${articles.length} articles to ${outputFile}`);
