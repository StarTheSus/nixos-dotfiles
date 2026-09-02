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
      intel-media-driver # VA_API (iHD) userspace
      intel-vaapi-driver # hm, same deal iirc
      vpl-gpu-rt # oneVPL (QSV) runtime
      libvdpau-va-gl # VDPAU-only apps
    ];
  };
}
