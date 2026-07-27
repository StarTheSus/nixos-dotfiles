#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "[E]: You must provide a template name."
  echo "Available templates in /home/star/projects/nix-templates:"
  eza -al --color=always --group-directories-first --icons always /home/star/projects/nix-templates
  exit 1
fi

TEMPLATE_PATH="/home/star/projects/nix-templates/$1"

if [ ! -d "$TEMPLATE_PATH" ]; then
  echo "[E]: Template '$1' not found at $TEMPLATE_PATH"
  exit 1
fi

nix flake init -t "$TEMPLATE_PATH"
echo "[ok]: Flake '$1' initialized."
