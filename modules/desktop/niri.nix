{ inputs, pkgs, ... }:

{
  imports = [
    inputs.noctalia.nixosModules.default
  ];

  # Shell
  programs.noctalia = {
    enable = true;
  };

  # WM
  programs.niri = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    polkit_gnome
    nautilus
    wl-clipboard
    xwayland-satellite
  ];

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;
}
