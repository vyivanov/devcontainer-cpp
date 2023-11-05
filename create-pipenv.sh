#!/usr/bin/env bash

set -xe

# FIXME: Try to directly specify 'Clang-Tidy' config file w/o copying.
cp .devcontainer/.clang-tidy "${PWD}"
cp .devcontainer/Pipfile "${PWD}"
pipenv update --verbose
