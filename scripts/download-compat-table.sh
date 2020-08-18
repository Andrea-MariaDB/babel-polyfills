#!/bin/bash
set -e

COMPAT_TABLE_COMMIT=40b385cb22a0d9194e4261c94210618bba9132f9
GIT_HEAD=build/compat-table/.git/HEAD

if [ -d "build/compat-table" ]; then
  cd build/compat-table
  commit="$(git rev-parse HEAD)"
  cd ../..

  if [ $commit == $COMPAT_TABLE_COMMIT ]; then
    exit 0
  fi
fi

rm -rf build/compat-table
mkdir -p build
git clone --branch=gh-pages --single-branch --shallow-since=2020-04-01 https://github.com/kangax/compat-table.git build/compat-table
cd build/compat-table && git checkout -qf $COMPAT_TABLE_COMMIT
