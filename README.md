# Web Page Screenshot Utility

This utility is designed to capture screenshots of complete web pages using Puppeteer and a bash script to automate the process. It allows you to specify input URLs and choose between saving the screenshots with either the title or the URL as the filename.

## Features

- Captures screenshots of web pages.
- Handles multiple URLs in a batch process.

## Dependencies

### Node.js and npm

Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine. npm is a package manager for Node.js modules.

You can install Node.js and npm by following the instructions on the [official Node.js website](https://nodejs.org/).

### Puppeteer

Puppeteer is a Node library that provides a high-level API over the Chrome DevTools Protocol, allowing for automated control over Chrome or Chromium browsers.

You can install Puppeteer via npm using the following command:

```
npm install -g puppeteer
```

## Usage

### Bash Script (`.sh`)

The bash script `grab_all.sh` is used to run the screenshot utility. It accepts input parameters to specify the input file containing URLs and the output option for filenames.
By default it will use the urls listed in urls.txt


### JavaScript Script (`.js`)

The JavaScript script `grab_url.js` utilizes Puppeteer to capture screenshots of web pages. It is invoked by the bash script with parameters passed from the command line.