#!/usr/bin/env bash
# exit on error
set -o errexit

# Install dependencies
mix deps.get --only prod
MIX_ENV=prod mix compile

# Assets
MIX_ENV=prod mix assets.deploy


# Migrate database
MIX_ENV=prod mix ecto.migrate
