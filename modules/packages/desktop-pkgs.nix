{ pkgs, ... }:

{
  programs = {
    starship = {
      enable = true;
    };
    mango.enable = true;
  };

  environment.systemPackages = with pkgs; [
    copyq
    satty
    grim
    fuzzel
    mpvpaper
    cava
  ];
}
