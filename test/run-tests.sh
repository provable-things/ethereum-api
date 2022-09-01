#!/bin/bash
set -e
cd "$(dirname -- $0)"

if [ ! -d "../node_modules" ]; then
  echo '✔ Installing dependencies...'
  cd ../ && npm ci && cd "$(dirname -- $0)"
  echo '✔ Dependencies installed!'
else
  echo '✔ Dependencies already installed ∴ skipping installation!'
fi

echo '✔ Running tests...'

./test-compilation.sh
