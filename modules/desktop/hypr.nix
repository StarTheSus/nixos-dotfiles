{ pkgs, ... }:

{
  # WM
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Hyprland Eco
  environment.systemPackages = with pkgs; [
    hyprlock
    hypridle
    hyprpicker
    hyprpaper
    polkit_gnome
  ];

  # xdg.portal = {
  #   extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # };
}
