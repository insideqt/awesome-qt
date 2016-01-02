#!/bin/sh

git config --global user.email "travis@travis-ci.org"
git config --global user.name "Travis CI"

git checkout -b gh-pages
git add . *.html
git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"

git fetch
git remote add origin-pages \
    https://${GH_TOKEN}@github.com/insideqt/awesome-qt.git > /dev/null 2>&1
# Quiet is important to not show the GH_TOKEN and reveal your token in the logs.
git push --quiet -f --set-upstream origin-pages gh-pages
