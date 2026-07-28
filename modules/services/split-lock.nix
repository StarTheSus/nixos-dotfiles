{ pkgs, ... }:

{
  systemd.tmpfiles.rules = [
    "d /tmp/gaming-triggers 0700 star users -"
  ];

  systemd.paths.split-lock-off = {
    description = "Inotify watch to disable split lock mitigation";
    wantedBy = [ "multi-user.target" ];
    pathConfig = {
      PathExists = "/tmp/gaming-triggers/split_lock_off";
    };
  };

  systemd.services.split-lock-off = {
    description = "Disable split lock mitigation (Gaming Mode)";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.procps}/bin/sysctl -w kernel.split_lock_mitigate=0";
      ExecStartPost = "${pkgs.coreutils}/bin/rm -f /tmp/gaming-triggers/split_lock_off";
    };
  };

  systemd.paths.split-lock-on = {
    description = "Inotify watch to enable split lock mitigation";
    wantedBy = [ "multi-user.target" ];
    pathConfig = {
      PathExists = "/tmp/gaming-triggers/split_lock_on";
    };
  };

  systemd.services.split-lock-on = {
    description = "Enable split lock mitigation (Standard Mode)";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.procps}/bin/sysctl -w kernel.split_lock_mitigate=1";
      ExecStartPost = "${pkgs.coreutils}/bin/rm -f /tmp/gaming-triggers/split_lock_on";
    };
  };
}
