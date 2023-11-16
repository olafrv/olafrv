import fs from 'fs/promises';
import axios from 'axios';
import cheerio from 'cheerio';

async function readJSONFile() {
  try {
    const inputFile = './slideshare_export_enriched.json';
    const outputFile = '../public/blog/articles.json';
    const data = await fs.readFile(inputFile, 'utf8');
    const jsonData = JSON.parse(data);
    const itemsArray = [];
    var i = 0;

    for (const item of jsonData) {
      const url = item.url;
      console.log(`Fetching meta tags from ${url}`);

      const response = await axios.get(url);
      const html = response.data;

      const $ = cheerio.load(html);

      $('meta').each((index, element) => {
        const tagName = $(element).attr('name') || $(element).attr('property');
        const tagContent = $(element).attr('content');
        console.log(tagName, tagContent);
        if (tagName == "twitter:player"){
            item.embed_url = tagContent;
        }
        if (tagName == "twitter:player:width"){
            item.width = tagContent;
        }
        if (tagName == "twitter:player:height"){
            item.height = tagContent;
        }
        if (!item.hasOwnProperty('img')) {
          item.img = "linux.png";
        }
      });

      item.id = ++i;
      delete item.description;
      delete item.privacy;
      delete item.tag;
      delete item.category;
      itemsArray.push(item);
      console.log(JSON.stringify(item));
    
    }

    await fs.writeFile(outputFile, JSON.stringify(itemsArray, null, 2));

  } catch (error) {
    console.error('Error reading file or fetching data:', error);
  }
}

readJSONFile();
