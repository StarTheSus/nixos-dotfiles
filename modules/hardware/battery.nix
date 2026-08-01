{ config, pkg, ... }:

{
  services.tlp = {
    enable = true;
    settings = {
      # Power management for PCIe
      RUNTIME_PM_ON_AC = "auto";

      # USB Denylist
      USB_DENYLIST = [
        "03f0:f22a"
        "045e:028e"
      ];

      # Radio state
      RESTORE_DEVICE_STATE_ON_STARTUP = 1;

      # Battery thresholds
      STOP_CHARGE_THRESH_BAT0 = 1;
      RESTORE_THRESHOLDS_ON_BAT = 1;

      # Don't kill sound, please
      SOUND_POWER_SAVE_ON_AC = 0;
      SOUND_POWER_SAVE_ON_BAT = 0;

      # Disable power-efficient workqueues on AC (N), enable on Battery (Y)
      SCHED_POWERSAVE_ON_AC = 0;
      SCHED_POWERSAVE_ON_BAT = 1;
    };
  };
  services.upower.enable = true;
}
