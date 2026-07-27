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
    xwayland-satellite
    kitty
    polkit_gnome
    wl-clipboard
  ];

  environment.sessionVariables = {
    XCURSOR_SIZE = "36";
  };

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;
}
