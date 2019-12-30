#!/bin/bash

set -euo pipefail

idir="${1}"
odir="${2}"
sprites="$(find ${idir} -type f -name *.png)"
find ${idir} -type d | parallel -I {} mkdir -p "${odir}/{}"

for f in $(echo "${sprites}"); do
  img2xterm -c "${f}" | sed '/^[[:space:]]*$/d' | sed 's/^    //g' > "${odir}/${f%.png}.cow"
done

