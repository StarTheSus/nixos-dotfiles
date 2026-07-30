{ config, pkgs, ... }:

{
  # General kernel module blacklists
  boot.blacklistedKernelModules = [
    "spd5118"
    # "ideapad_laptop" # Required for TLP battery conservation, so it's kept, for now
  ];

  # General modprobe options
  boot.extraModprobeConfig = ''
    options snd_hda_intel power_save=0
  '';
}
