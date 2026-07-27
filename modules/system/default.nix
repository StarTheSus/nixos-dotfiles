{ ... }:

{
  imports = [
    ./kernel.nix
    ./bootloader.nix
    ./services.nix
    ./network.nix
  ];
}
