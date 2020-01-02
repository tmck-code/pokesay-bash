#!/bin/bash

set -euo pipefail

idir="${1}"
odir="${2}"
sprites="$(find ${idir} -type f -name *.png)"
find ${idir} -type d | parallel -I {} mkdir -p "${odir}/{}"

mkdir /tmp/cows
for f in $(echo "${sprites}"); do
  img2xterm -c "${f}" | sed '/^[[:space:]]*$/d' | sed -E 's/^[[:space:]]{2,6}//g' > "${odir}/${f%.png}.cow"
  mv "${odir}/${f%.png}.cow" /tmp/cows
done

