{ ... }:

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
}
