{ pkgs, ... }:

{
  # SDDM Wayland
  services.displayManager.sddm = {
    enable = true;
    wayland = {
      enable = true;
    };
    settings = {
      Theme = {
        CursorTheme = "Future-cyan-cursors";
        CursorSize = 26;
      };
    };
  };

  # Force the SDDM service to read the cursor globally
  systemd.services.display-manager.environment = {
    XCURSOR_THEME = "Future-cyan-cursors";
    XCURSOR_SIZE = "26";
  };

  programs.qylock = {
    enable = true;
    theme = "nier-automata";
  };

  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
