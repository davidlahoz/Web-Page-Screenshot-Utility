# Web Page Screenshot Utility

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This utility is designed to capture screenshots of complete web pages using Puppeteer and a bash/powershell script to automate the process. It allows you to specify input URLs and choose between saving the screenshots with either the title or the URL as the filename.

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

## Info

### `grab_all.*`

These scripts facilitate the execution of the screenshot utility. They accept input parameters to specify the input file containing URLs and the output directory for saving screenshots. By default, the URLs listed in `urls.txt` are utilized.

There are two versions that do the exact same thing but for different platforms.
- `grab_all.ps1` to be used with Windows-based devices to avoid the hassle of enabling bash
- `grab_all.sh` to be used with Linux/MacOS devices.

### `grab_url.js`

The JavaScript script `grab_url.js` utilizes Puppeteer to capture screenshots of web pages. It is invoked by the bash script with parameters passed from the command line.

### `urls.txt`

Here you will place the URLs that you want to take a full screenshot.

### `/output/`
Screenshots will be saved there.

## Usage

To utilize these scripts:

1. Place all files in the desired folder.
2. Edit `urls.txt` to include the URLs you wish to process.
3. Run the appropriate platform-specific script:

   - **Windows:**
     ```
     powershell .\grab_all.ps1
     ```

   - **Linux/MacOS:**
     ```
     bash grab_all.sh
     ```

   The screenshots will be saved in `/output/` as PNG files.

## License

This project is licensed under the terms of the [MIT License](https://opensource.org/licenses/MIT). See the [LICENSE](LICENSE) file for details.