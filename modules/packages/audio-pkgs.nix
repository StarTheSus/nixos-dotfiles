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
    helvum
    pavucontrol
	jamesdsp
	easyeffects
  ];
}
