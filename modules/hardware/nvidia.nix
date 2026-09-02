{ config, ... }:

{
  # GET OUUUUUUUT
  boot.blacklistedKernelModules = [ "nouveau" ];

  # use novideo's driver
  services = {
    xserver.videoDrivers = [
    "modesetting" # allow nvidia to sleep by relying on intel iGPU
    "nvidia"
    ];
    udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x040300", ATTR{remove}="1"
    '';
    # You see, this mfer is responsible for audio through HDMI, and is the one holding my god damned
    # Nvidia hostage preveneting suspend.
    # Trying `echo 1 | sudo tee /sys/bus/pci/devices/0000:01:00.1/remove` turned it off
    # And after such, nvidia card slept.
  };

  hardware.nvidia = {
    # Options
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = true;
    # I SAAAAAAAAAID, GET OUUUUUUUUUUUUUUUT
    open = false;
    # Nvidia Settings Menu
    nvidiaSettings = true;
    # Prod, stable in theory
    package = config.boot.kernelPackages.nvidiaPackages.production;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      intelBusId = "PCI:0@0:2:0";
      nvidiaBusId = "PCI:1@0:0:0";
      # intelBusId = "PCI:0:2:0";
      # nvidiaBusId = "PCI:1:0:0";
    };
  };

  # Nix doesn't wrap these... for some reason
  boot.extraModprobeConfig = ''
    options nvidia NVreg_TemporaryFilePath=/var/tmp
    options nvidia NVreg_PreserveVideoMemoryAllocations=1
    # options nvidia NVreg_DynamicPowerManagement=0x03
  '';
}
