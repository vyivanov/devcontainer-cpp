#!/usr/bin/env bash

set -xe

# FIXME: Try to directly specify 'Clang-Tidy' configs file w/o copying.
cp .devcontainer/.clang-* "${PWD}"
cp .devcontainer/Pipfile "${PWD}"
pipenv update --verbose
