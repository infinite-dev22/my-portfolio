#!/bin/bash
# A simple script to build a web release of this flutter project

echo "Building web release ..."

# Define variables
BUILD_TYPE=--wasm
BASE_HREF="/my-portfolio/"

#flutter build web $BUILD_TYPE --release --base-href $BASE_HREF

echo "DONE"

echo "Deploying website to production ..."

peanut --branch gh-pages --release --wasm --extra-args "--base-href $BASE_HREF"

echo "Website deployed"