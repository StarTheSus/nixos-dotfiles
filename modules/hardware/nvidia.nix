{ config, pkgs, ... }:

{
  # GET OUUUUUUUT
  boot.blacklistedKernelModules = [ "nouveau" ];

  # Enable Graphics HW Acceleration
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # use novideo's driver
  services.xserver.videoDrivers = [
    "modesetting" # For offloading, to allow nvidia to sleep
    "nvidia"
  ];

  hardware.nvidia = {
    # Options
    modesetting.enable = true;
    powerManagement.enable = true;
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
    };
  };

  # Nix doesn't wrap these... for some reason
  boot.extraModprobeConfig = ''
        options nvidia NVreg_TemporaryFilePath=/var/tmp
    	options nvidia NVreg_PreserveVideoMemoryAllocations=1
        # options nvidia NVreg_DynamicPowerManagement=0x03
  '';
}
