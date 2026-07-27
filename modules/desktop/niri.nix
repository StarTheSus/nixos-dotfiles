{ inputs, pkgs, ... }:

{
  imports = [
    inputs.noctalia.nixosModules.default
  ];

  # WM
  programs.niri = {
    enable = true;
    recommendedServices.enable = true;
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
