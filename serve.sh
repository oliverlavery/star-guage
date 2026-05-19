#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

PORT=8080

if lsof -i :"$PORT" >/dev/null 2>&1; then
    echo "Port $PORT is already in use."
    exit 1
fi

echo "Starting server on http://0.0.0.0:$PORT ..."
python3 -m http.server "$PORT" --bind 0.0.0.0
