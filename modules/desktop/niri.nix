{ inputs, pkgs, ... }:

let
  oldPkgs = (builtins.getFlake "github:nixos/nixpkgs/a5cbcfe954791221bfffe2307f7d1a1bf61a871e").legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
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
    wl-clipboard
    oldPkgs.xwayland-satellite
  ];

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;
}
