#!/usr/bin/env bash
# exit on error
set -o errexit
# Initial setup
mix deps.get --only prod
MIX_ENV=prod mix compile
# Compile assets
MIX_ENV=prod mix assets.deploy
# Build the release and overwrite the existing release directory
MIX_ENV=prod mix release --overwrite

_build/prod/rel/my_live_app/bin/my_live_app eval "DeployToRender.Release.migrate"