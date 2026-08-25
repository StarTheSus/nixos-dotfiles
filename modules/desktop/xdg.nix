{ pkgs, lib, ... }:

{
  # Extra pkgs
  environment.systemPackages = with pkgs; [
    xdg-utils
    xdg-user-dirs
  ];

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
      ];
      # Force the system to actually use them
      # config.common.default = "*";
      config = {
        niri = {
          # Use GTK by default for all basic dialogs (like the file picker)
          default = lib.mkForce [ "gtk" ];

          # Explicitly route screen sharing and casting to the GNOME portal ffs
          "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
          "org.freedesktop.impl.portal.Screenshot" = [ "gnome" ];
        };
      };
    };
    mime.defaultApplications = {
      "inode/directory" = [ "yazi.desktop" ];
      "x-scheme-handler/terminal" = [ "kitty.desktop" ];
    };
  };
}
