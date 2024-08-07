#!/bin/sh

nix shell nixpkgs#wrangler nixpkgs#hugo --command just deploy
