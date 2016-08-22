#!/bin/bash

set -e
set -x


mv deps.lua deps.old.lua
lua tools/gendeps.lua > deps.lua

GRC=""
if [ -e "/usr/bin/grc" ]; then GRC="/usr/bin/grc"; fi
${GRC} diff -u deps.old.lua deps.lua || true

rm deps.old.lua
