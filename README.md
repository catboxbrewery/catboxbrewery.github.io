# Catbox Brewery

This is the website for Catbox Brewery, the personal blog of Russ Loucks.

## Introduction

Follow the instructions for getting started with [jekyll][jekyll]. Skip the part about creating a
new site, since it's already here.

## A Responsive Jekyll Theme: *Feeling Responsive*

This site is based on the *Feeling Responsive* theme developed by [Moritz Sauer][moritz].
The [git repository][repo] and [sample site][sample] are available for reference. Note that
the sample site includes [documentation][documentation].

The theme was discovered on the [Jekyll Themes][themes] website.

## Running Locally

```bash
$ bundle exec jekyll serve --config _config.yml,_config_dev.yml --livereload
```

## Creating Gallery Thumbnails

Prerequisite: imagemagick

```bash
$ convert input.jpg -thumbnail
```

---

[jekyll]: https://jekyllrb.com/
[themes]: https://jekyllthemes.io/
[moritz]: https://github.com/Phlow/
[repo]: https://github.com/Phlow/feeling-responsive/
[sample]: http://phlow.github.io/feeling-responsive/
[documentation]: http://phlow.github.io/feeling-responsive/documentation/
