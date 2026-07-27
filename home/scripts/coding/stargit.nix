{ pkgs }:

pkgs.writeShellScriptBin "stargit" ''
  #!/usr/bin/env bash

  # configuration values
  USER_NAME="Star"
  USER_EMAIL="252556693+StarTheSus@users.noreply.github.com"
  SIGNING_KEY="/home/star/.ssh/id_ed25519_star_signing"

  apply_configs() {
    local target_dir="''${1:-.}"
    echo "Applying stargit configs to '$target_dir'..."
    
    # Ensure it's a git repository before applying
    if [ ! -d "$target_dir/.git" ]; then
      echo "Error: '$target_dir' is not a git repository."
      return 1
    fi

    git -C "$target_dir" config --local user.name "$USER_NAME"
    git -C "$target_dir" config --local user.email "$USER_EMAIL"
    git -C "$target_dir" config --local user.signingkey "$SIGNING_KEY"
    git -C "$target_dir" config --local gpg.format ssh
    git -C "$target_dir" config --local commit.gpgsign true
    
    echo "[ok]: Repo is now configured for Star."
  }

  COMMAND="$1"
  shift # Remove the command from the argument list so we can pass the rest to git

  case "$COMMAND" in
    init)
      git init "$@"
      
      # Try to find the directory git init just used. Defaults to current dir
      DIR="."
      for arg in "$@"; do
        if [[ "$arg" != -* ]]; then
          DIR="$arg"
        fi
      done
      
      apply_configs "$DIR"
      ;;
      
    clone)
      git clone "$@"
      
      # Try to guess the cloned directory name
      DIR=""
      for arg in "$@"; do
        if [[ "$arg" != -* ]]; then
          DIR="$arg"
        fi
      done
      
      # If the last non-flag argument was a URL, extract the folder name
      if [[ "$DIR" == *://* ]] || [[ "$DIR" == *@*:* ]]; then
        DIR=$(basename "$DIR" .git)
      fi
      
      if [ -d "$DIR" ]; then
        apply_configs "$DIR"
      else
        echo "[E]: Could not auto-detect the cloned directory name."
        echo "[i]: Please 'cd' into the new folder and run 'stargit edit'."
      fi
      ;;
      
    edit)
      apply_configs "."
      ;;
      
    *)
      echo "Usage: stargit {init|clone|edit} [standard git arguments...]"
      echo "Examples:"
      echo "  stargit init my-new-repo"
      echo "  stargit clone git@github.com:User/repo.git"
      echo "  stargit edit  (run inside an existing repo to fix configs)"
      exit 1
      ;;
  esac
''
