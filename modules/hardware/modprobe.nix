{ config, pkgs, ... }:

{
  # General kernel module blacklists
  boot.blacklistedKernelModules = [
    "spd5118"
    # "ideapad_laptop" # Required for TLP battery conservation, so it's kept, for now
  ];

  # General modprobe options
  boot.extraModprobeConfig = ''
    # Add future non-GPU specific modprobe options here
  '';
}
