{ ... }:

{
  imports = [
    ./kernel.nix
    ./bootloader.nix
    ./services.nix
    ./network.nix
    ./systemd.nix
  ];
}
