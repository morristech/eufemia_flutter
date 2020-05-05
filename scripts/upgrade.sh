#!/bin/bash

cd packages
for D in *; do [ -d "${D}" ] && cd "${D}" && flutter packages upgrade && cd ..; done
