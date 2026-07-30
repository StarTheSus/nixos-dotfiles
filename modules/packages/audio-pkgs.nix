{ pkgs, ... }:

{
  programs = {
    starship = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    sound-theme-freedesktop
    pulseaudio # Cli only
    wiremix
    alsa-utils # For amixer
    helvum
    pavucontrol
    jamesdsp
    easyeffects
  ];
}
