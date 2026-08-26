{ pkgs, inputs, ... }:

{
  boot = {
    loader = {
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
        splashImage = null; # DIE
        theme = inputs.cybergrub-2077.packages.${pkgs.stdenv.hostPlatform.system}.mkTheme {
          logo = "nixos";
        };
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
    plymouth = {
      enable = true;
      theme = "hexagon_dots_alt";

      # Override the package to only install my selected theme
      # cuz this package is HUGE
      themePackages = [
        (pkgs.adi1090x-plymouth-themes.override {
          selected_themes = [ "hexagon_dots_alt" ];
        })
      ];
    };
    # Don't print stuff plz
    consoleLogLevel = 0;
    initrd = {
      systemd.enable = true;
      verbose = false;
    };
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
  };
}
