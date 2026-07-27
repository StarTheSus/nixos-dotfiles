{ config, pkgs, ... }:

{
  # SDDM Wayland
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

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

  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10; 
    };
  };

  # xdg.portal = {
  #   extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # };
}
