#!/bin/bash

mkdir -pv build
cd build

# No need to check out a particular commit hash since we're branched from the one we care about (af4666f).
echo "------------- Ready to go! -------------"
echo "To build the project, run the 'build' task in the VS Code."
