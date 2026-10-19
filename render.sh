#!/usr/bin/env bash
# Render .puml files via a PlantUML server.
#   ./render.sh examples/05_label_nodes_refined.puml [png|svg]
# Server defaults to http://localhost:8080, override with PLANTUML_SERVER.
# Note: the server cannot resolve local !include files, so every diagram is self-contained.
set -euo pipefail
server="${PLANTUML_SERVER:-http://localhost:8080}"
fmt="${2:-png}"
out="${1%.puml}.$fmt"
curl -sf -X POST --data-binary @"$1" -H 'Content-Type: text/plain' "$server/$fmt" -o "$out"
echo "$out"
