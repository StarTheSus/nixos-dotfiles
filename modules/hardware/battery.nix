{ config, pkg, ... }:

{
	services.tlp = {
		enable = true;
		settings = {
		# Power management for PCIe
      	RUNTIME_PM_ON_AC = "auto";

      	# USB Denylist
      	USB_DENYLIST = [ "03f0:f22a" "045e:028e" ];

      	# Radio state
      	RESTORE_DEVICE_STATE_ON_STARTUP = 1;

      	# Battery thresholds
      	STOP_CHARGE_THRESH_BAT0 = 1;
      	RESTORE_THRESHOLDS_ON_BAT = 1;
		};
	};
	services.upower.enable = true;
}
