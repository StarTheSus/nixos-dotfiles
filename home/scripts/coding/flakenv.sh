#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "[E]: You must provide a template name."
  echo "Available templates in /home/star/projects/nix-templates:"
  eza -al --color=always --group-directories-first --icons always /home/star/projects/nix-templates
  exit 1
fi

MASTER_DIR="/home/star/projects/nix-templates"
TEMPLATE_PATH="/home/star/projects/nix-templates/$1"

if [ ! -d "$TEMPLATE_PATH" ]; then
  echo "[E]: Template '$1' not found at $TEMPLATE_PATH"
  exit 1
fi

if nix flake init -t "$MASTER_DIR#$1"; then
  echo "[ok]: Flake '$1' initialized. You can now run 'nix develop'."
else
  echo "[E]: Failed to initialize template '$1'."
  exit 1
fi
