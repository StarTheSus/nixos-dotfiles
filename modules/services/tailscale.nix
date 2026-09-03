{ lib, ... }:

{
  services.tailscale = {
    enable = true;
    extraSetFlags = [ "--ssh" ];
  };

  systemd.services.tailscaled.wantedBy = lib.mkForce [ ];
}
