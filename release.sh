#!/bin/bash
# A simple script to build a web release of this flutter project

echo "Setting up build environment"

BASE_HREF="/my-portfolio/"

echo "DONE"

echo "Building web release ..."

peanut --branch gh-pages --release --extra-args "--base-href $BASE_HREF"

echo "DONE"

echo "Patching production release on gh-pages ..."

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

echo "Saving current branch: $CURRENT_BRANCH"

echo "Switching to gh-pages branch ..."
git fetch origin gh-pages || true
git checkout gh-pages

echo "Setting icons"
mkdir -p build/web/icons
rm -rf build/web/icons/*
cp -r assets/icons/* build/web/icons/

echo "Setting manifest"
rm -f build/web/manifest.json
cp assets/manifest.json build/web/

echo "Setting html pages"
rm -f build/web/index.html
cp assets/pages/* build/web/

echo "DONE"

echo "Saving changes on gh-pages"
git add .

if git diff --cached --quiet; then
  echo "No changes to commit"
else
  git commit -m "Updated icons, manifest, and html pages"
  git push origin gh-pages
fi

echo "Switching back to $CURRENT_BRANCH ..."
git checkout "$CURRENT_BRANCH"

echo "Patch complete"

echo "Deploying website to production ..."
git push origin --set-upstream gh-pages

echo "Website deployed"