{ pkgs, inputs, ... }:

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
    bandwhich = {
        enable = true;
    };
  };

  # Core   # TODO: cleanup
  environment.systemPackages = with pkgs; [
    equibop
    telegram-desktop
    qbittorrent
    vivaldi
    heroic
    kitty
    gcc
    gnumake
    obsidian
    libnotify
    fastfetch

    # git
    jujutsu
    gh

    # archives
    p7zip
    zip
    unrar
    xz
    unzip
    gnutar

    # coreutils
    file
    which
    tree
    gnused
    gawk
    psmisc
    keychain

    # Productivity
    ripgrep
    fd
    fzf
    eza
    btop
    iotop
    nvtopPackages.nvidia
    nvtopPackages.intel
    intel-gpu-tools
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
    ddcutil
    smartmontools
    libqalculate

    # Debug
    bpftrace

    # Audio
    mpv
    (mpv.override { scripts = [ mpvScripts.mpris ]; })
    playerctl

    # Inputs
    inputs.doors.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
