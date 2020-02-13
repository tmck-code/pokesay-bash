#!/bin/bash

set -euo pipefail

idir="${1}"
odir="${2}"
sprites="$(find ${idir} -type f -name *.png)"
find ${idir} -type d | parallel -I {} mkdir -p "${odir}{}"

mkdir -p /tmp/cows
for f in $(echo "${sprites}"); do
  ofpath="${odir}${f%.png}.cow"
  img2xterm -c "${f}" | sed '/^[[:space:]]*$/d' | sed -E 's/^[[:space:]]{2,6}//g' > "${ofpath}"
  local_path=${ofpath##*icons/}
  mkdir -p "$(dirname /tmp/cows/${local_path})"
  mv ${ofpath} /tmp/cows/${local_path}
done

