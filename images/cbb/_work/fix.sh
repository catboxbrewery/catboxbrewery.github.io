#!/usr/bin/bash

for f in ../header{1,2,3,4,5}.jpg ; do
    python ../../../../catboxbrewery-scraper/scraper/thumbgen.py -y 60 ${f}
done

