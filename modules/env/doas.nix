{ ... }:

{
  security.doas.enable = true;

  security.doas.extraRules = [
    # Base Wheel & Root Rules
    {
      groups = [ "wheel" ];
      keepEnv = true;
      persist = true;
    }
    {
      users = [ "root" ];
      keepEnv = true;
      noPass = true;
    }

    # Global Nopass Commands for Wheel
    {
      groups = [ "wheel" ];
      noPass = true;
      cmd = "loadkeys";
    }
    {
      groups = [ "wheel" ];
      noPass = true;
      cmd = "mount";
    }
    {
      groups = [ "wheel" ];
      noPass = true;
      cmd = "umount";
    }
    {
      groups = [ "wheel" ];
      noPass = true;
      cmd = "openvpn";
    }

    # Specific User Scripts & Args
    # {
    #   users  = [ "star" ];
    #   noPass = true;
    #   cmd    = "/path/to/script";
    # }
    {
      users = [ "star" ];
      noPass = true;
      cmd = "systemctl";
      args = [
        "start"
        "waydroid-container"
      ];
    }
  ];
}
