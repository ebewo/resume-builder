#!/usr/bin/env bash

mkdir -p out
cp -a static out/static/

echo "Generating html"
pandoc -s ./content/resume.md -H ./templates/header.html -c static/resume.css -o ./out/resume.html
pandoc -s ./content/letter.md -H ./templates/header.html -c static/letter.css -o ./out/letter.html
pandoc -s ./content/references.md -H ./templates/header.html -c static/references.css -o ./out/references.html

echo "Generating pdfs"
phantomjs bin/rasterize.js out/resume.html out/resume.pdf 0.7
phantomjs bin/rasterize.js out/references.html out/references.pdf 0.8
phantomjs bin/rasterize.js out/letter.html out/letter.pdf 0.8

echo "Done"
