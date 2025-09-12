---
layout: page
title: "About the Brewery"
author: sisyphuscafe
subheadline: "Whatever happened to WordPress?"
teaser: "This site represents a simpler approach to building a website, using Jekyll, an open source template and hosted on GitHub Pages."
permalink: "/info/"
show_meta: true
date: 2025-08-23
categories:
    - information
header:
    image_fullwidth: "unsplash_9.jpg"
---

The goal was to move away from an expensive web host and a decidedly bloated CMS platform ([WordPress][wordpress]). Since this
site is, for the most part, static, the richness of a CMS is helpful only in the context of the initial build.
[GitHub Pages][pages] offers an ideal platform to build and maintain a site, especially if the content doesn't change all that often. [*Feeling Responsive*][feeling-responsive] is a template built by [Moritz Sauer][phlow].

## Process

The process to migrate the site was fairly straightforward. First, stand up a new jekyll site locally, download and install the shiny new template, and migrate the content. The content migration was the most arduous, but my goal was to automate the migration of each travel log individually.

## Content Migration

Since the original WordPress site was not overly complex, and followed a uniform structure, it was a relatively simple matter to write a recursive scraper to visit each travel log individually, follow the links to the main articles, and then scrape and convert the content and download the images.

I wrote a separate utility to create thumbnail images for the image galleries after the fact.

The scraper and thumbnail generator were both written in [Python][python], using several libraries beyond the obvious:

* [plac][plac]: A simple library to facilitate command line parsing
* [requests][requests]: A simple HTTP library
* [BeautifulSoup][soup]: A library for pulling data out of HTML and XML files
* [markdownify][markdownify]: A library for converting HTML to markdown
* [PyYAML][yaml]: A YAML parser and emitter
* [pillow][pillow]: A PIL Fork providing extensive image processing capabilities

### scraper

```bash
$ python scraper/main.py -h
usage: main.py [-h] [-v] [-i] [-b travelog] [-d cbb] [-s None] url category title

Scrape the given URL and generate output to support website migration from WordPress to jekyll.

positional arguments:
  url                  The URL to fetch/parse
  category             The blog category
  title                The blog title

options:
  -h, --help           show this help message and exit
  -v, --verify         Verify SSL certificate
  -i, --images         Download images
  -b, --blog travelog  The blog name
  -d, --dest cbb       The destination image folder, rooted in /images directory within jekyll site
  -s, --start None     The publication date for first article, derived from post if not specified
```

### thumbgen

```bash
$ python scraper/thumbgen.py -h
usage: thumbgen.py [-h] [-x 200] [-y 150] source [destination]

Generate a thumbnail image of a specific size from the given source image.

positional arguments:
  source       The source image
  destination  The destination image, derived if not specified

options:
  -h, --help   show this help message and exit
  -x, --x 200  The destination image width
  -y, --y 150  The destination image height
```


Statistics:

* Individual Images (including thumbnails): 913
* Individual Posts: 55

---

[pages]: https://docs.github.com/en/pages
[wordpress]: https://wordpress.org
[phlow]: https://github.com/phlow
[feeling-responsive]: https://github.com/phlow/feeling-responsive
[python]: https://python.org
[plac]: https://pypi.org/project/plac/
[requests]: https://requests.readthedocs.io/en/latest/
[soup]: https://beautiful-soup-4.readthedocs.io/en/latest/
[markdownify]: https://pypi.org/project/markdownify/
[pillow]: https://pillow.readthedocs.io/en/stable/index.html
