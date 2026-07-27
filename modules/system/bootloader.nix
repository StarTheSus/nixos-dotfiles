{ config, pkgs, ... }:

{
	# Systemd-boot
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
  	boot.loader.systemd-boot.configurationLimit = 20;

	# Grub
	# boot.loader.systemd-boot.enable = false;
	# boot.loader.efi.canTouchEfiVariables = true;
	# boot.loader.grub = {
	# 	enable = true;
	#  		efiSupport = true;
	#  		device = "nodev"; # Required for UEFI
	#  		theme = /path/to/custom/grub/theme;
	# };
}
