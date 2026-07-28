{ pkgs, ... }:

{
  # Intercept the directory with a 1MB RAM disk
  # This spares my SSD while keeping the path visible to Steam's sandbox
  fileSystems."/home/star/scripts/system/gaming/triggers" = {
    device = "tmpfs";
    fsType = "tmpfs";
    # Resolves ownership to my user and locks out other users
    options = [
      "size=1M"
      "mode=0700"
      "uid=star"
      "gid=users"
    ];
  };

  systemd.paths.split-lock-off = {
    description = "Inotify watch to disable split lock mitigation";
    wantedBy = [ "multi-user.target" ];
    pathConfig = {
      PathExists = "/home/star/scripts/system/gaming/triggers/split_lock_off";
    };
  };

  systemd.services.split-lock-off = {
    description = "Disable split lock mitigation (Gaming Mode)";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.procps}/bin/sysctl -w kernel.split_lock_mitigate=0";
      ExecStartPost = "${pkgs.coreutils}/bin/rm -f /home/star/scripts/system/gaming/triggers/split_lock_off";
    };
  };

  systemd.paths.split-lock-on = {
    description = "Inotify watch to enable split lock mitigation";
    wantedBy = [ "multi-user.target" ];
    pathConfig = {
      PathExists = "/home/star/scripts/system/gaming/triggers/split_lock_on";
    };
  };

  systemd.services.split-lock-on = {
    description = "Enable split lock mitigation (Standard Mode)";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.procps}/bin/sysctl -w kernel.split_lock_mitigate=1";
      ExecStartPost = "${pkgs.coreutils}/bin/rm -f /home/star/scripts/system/gaming/triggers/split_lock_on";
    };
  };
}
