{ config, pkgs, ... }:

{
  # Zen kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;
  # REISUB sysrq
  boot.kernel.sysctl = {
    "kernel.sysrq" = 1;
  };
}
