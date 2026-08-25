{ pkgs, lib, ... }:

{
  # Extra pkgs
  environment.systemPackages = with pkgs; [
    xdg-utils
    xdg-user-dirs
  ];

        # Explicitly route screen sharing and casting to the GNOME portal
        "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "gnome" ];
      };
    };
  };
}
