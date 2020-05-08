#!/bin/bash

cd packages
cd eufemia && pub publish -f
cd .. && cd eufemia_components && pub publish -f
cd .. && cd eufemia_palette && pub publish -f
cd .. && cd eufemia_spacing && pub publish -f
cd .. && cd eufemia_typography && pub publish -f

exit 0

#for D in *; do [ -d "${D}" ] && cd "${D}" && pub publish -f; done
