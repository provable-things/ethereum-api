#!/bin/bash
set -e
cd "$(dirname -- $0)"

artifactsPath="../artifacts"

if [ -d $artifactsPath ]; then
  echo '✔ Removing compiled artifacts dir...'
  rm -r $artifactsPath
  echo '✔ Artifacts dir removed!'
fi

echo '✔ Testing Provable API compilation...'
npx hardhat compile
