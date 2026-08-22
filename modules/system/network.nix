{ ... }:

{
  networking = {
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
      wifi.powersave = false;
    };
    firewall = {
      enable = true;
      # Minecraft moment
      allowedTCPPorts = [ 6969 ];
    };
  };

  services.openssh = {
    enable = true;
    ports = [ 2222 ];
    openFirewall = true;
  };
}
