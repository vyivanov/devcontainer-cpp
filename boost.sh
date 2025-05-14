#!/usr/bin/env bash

set -xe

rm -rf "${PWD}/.vscode/"
cp --recursive .devcontainer/vscode/ "${PWD}/.vscode/"

cp .devcontainer/clang/clang-format "${PWD}/.clang-format"
cp .devcontainer/clang/clang-tidy   "${PWD}/.clang-tidy"
