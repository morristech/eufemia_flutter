#!/bin/bash

cd packages/eufemia && pub publish -f
#for D in *; do [ -d "${D}" ] && cd "${D}" && pub publish -f; done
