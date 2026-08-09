{ pkgs, inputs, ... }:

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
      theme = inputs.cybergrub-2077.packages.${pkgs.system}.mkTheme { logo = "nixos"; };
      gfxmodeEfi = "auto";
      gfxpayloadEfi = "keep";
      # memtest86.enable = true;
      extraFiles = {
        "memtest.efi" = pkgs.memtest86plus.efi;
      };
      extraEntries = ''
        menuentry "Poweroff" --class shutdown {
          halt
        }

        menuentry "UEFI Firmware Settings" --class uefi {
          fwsetup
        }

        menuentry "Memory Tester (memtest86+)" --class memtest {
        chainloader /memtest.efi
        }
      '';
    };
  };
}
