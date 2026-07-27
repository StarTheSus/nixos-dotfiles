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
  services.xserver.videoDrivers = [ "nvidia" ];

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
  };

  # Nix doesn't wrap these... for some reason
  boot.extraModprobeConfig = ''
    options nvidia NVreg_TemporaryFilePath=/var/tmp
	options nvidia NVreg_PreserveVideoMemoryAllocations=1
    # options nvidia NVreg_DynamicPowerManagement=0x03
  '';
}
