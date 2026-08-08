{ pkgs, ... }:

{
  boot.loader = {
    # Shared
    efi.canTouchEfiVariables = true;

    # Systemd-boot
    # systemd-boot.configurationLimit = 20;
    # systemd-boot.enable = true;

    # Grub
    systemd-boot.enable = false;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      theme = pkgs.sleek-grub-theme; # TODO: change this shi

      # gfxmodeEfi = "1920x1080"; # May or may not need it, Idk
    };
  };
}
