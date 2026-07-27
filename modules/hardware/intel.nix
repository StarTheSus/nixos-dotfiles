{ pkgs, ... }:

{
  boot = {
    initrd.kernelModules = [ "i915" ];
    blacklistedKernelModules = [ "xe" ];
    extraModprobeConfig = ''
      		options i915 modeset=1 enable_guc=2
      	  '';
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      libvdpau-va-gl
    ];
  };
}
