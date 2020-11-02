#!/bin/bash
set -e

# Make sure to always have fresh base image
docker pull ubuntu:20.04
# Install dev dependencies
docker build -t jxs01/gstreamer:latest-dev-dependencies -f Dockerfile-dev-dependencies .
# Download source code
docker build -t jxs01/gstreamer:latest-dev-downloaded -f Dockerfile-dev-downloaded .
# Build dev image with source code included
# Build base production image with necessary dependencies
docker build -t jxs01/gstreamer:latest-prod-base -f Dockerfile-prod-base .
# Build production image optimized binaries and no debug symbols (-O3 LTO)
docker build -t jxs01/gstreamer:latest-prod -f Dockerfile-prod .
# Build production image optimized binaries and debug symbols
