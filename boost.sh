#!/usr/bin/env bash

set -xe

rm -rf "${PWD}/.vscode/"
cp --recursive .devcontainer/vscode/ "${PWD}/.vscode/"
