#!/bin/bash
# A simple script to build a web release of this flutter project

echo "Setting up build environment"

BASE_HREF="/my-portfolio/"

echo "DONE"

echo "Building web release ..."

peanut --branch gh-pages --release --extra-args "--base-href $BASE_HREF"

echo "DONE"

echo "Patching production release ..."

echo "Setting icons"
rm -r build/web/icons/*
cp -r assets/icons/* build/web/icons/

echo "Setting manifest"
rm -r build/web/manifest.json
cp -r assets/manifest.json build/web/

echo "Setting manifest"
rm -r build/web/index.html
cp -r assets/pages/* build/web/

echo "DONE"

echo "Deploying website to production ..."
git push origin --set-upstream gh-pages

echo "Website deployed"