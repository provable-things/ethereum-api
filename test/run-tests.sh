#!/bin/bash
set -e
cd "$(dirname -- $0)"

echo '✔ Running tests...'

./test-compilation.sh
