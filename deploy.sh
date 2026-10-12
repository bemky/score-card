#!/usr/bin/env bash
# Deploy the static app. Settings live in deploy.env (not in git);
# copy deploy.env.example to deploy.env and fill it in.
# Usage: ./deploy.sh [extra rsync args, e.g. --dry-run]
set -euo pipefail

cd "$(dirname "$0")"
if [[ ! -f deploy.env ]]; then
  echo "Missing deploy.env — copy deploy.env.example and fill it in." >&2
  exit 1
fi
source ./deploy.env
: "${DEPLOY_HOST:?set DEPLOY_HOST in deploy.env}"
: "${DEPLOY_PATH:?set DEPLOY_PATH in deploy.env}"

rsync -avz --delete \
  --include='index.html' \
  --include='manifest.webmanifest' \
  --include='*.png' \
  --exclude='*' \
  "$@" \
  ./ "$DEPLOY_HOST:${DEPLOY_PATH%/}/"

# Make sure the web server can read everything (macOS openrsync lacks --chmod)
if [[ " $* " != *" --dry-run "* && " $* " != *" -n "* ]]; then
  ssh "$DEPLOY_HOST" "find '${DEPLOY_PATH%/}' -mindepth 1 -user \"\$(id -un)\" -exec chmod u=rwX,go=rX {} +"
fi
