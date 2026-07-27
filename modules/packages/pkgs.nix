{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs = {
    zsh = {
      enable = true;
    };
    neovim = {
      enable = true;
    };
    tmux = {
      enable = true;
    };
    git = {
      enable = true;
      config = {
        safe = {
          directory = "/home/star/nixos";
        };
      };
    };
    lazygit = {
      enable = true;
    };
    bat = {
      enable = true;
    };
    yazi = {
      enable = true;
    };
    zoxide = {
      enable = true;
    };
    starship = {
      enable = true;
    };
  };

  # Core   # TODO: cleanup
  environment.systemPackages = with pkgs; [
    equibop
    vivaldi
    heroic
    kitty
    gcc
    gnumake
    noctalia-shell
    obsidian
    libnotify
    fastfetch

    # git
    jujutsu
    gh

    # archives
    p7zip
    zip
    xz
    unzip
    gnutar

    # coreutils
    file
    which
    tree
    gnused
    gawk
    killall
    keychain

    # Productivity
    ripgrep
    fd
    fzf
    eza
    btop
    iotop
    nvtopPackages.nvidia
    tmate
    delta
    bbe

    # Langs
    nodejs
    python3
    cargo
    rustc

    # misc
    jq
    wget
    zstd
    plocate
    duf
    dust
    dotool
    gdown
    songrec
  ];
}
