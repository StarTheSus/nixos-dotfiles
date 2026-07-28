{
  description = "Star's Nixos config";
  inputs = {
    # This is pointing to an unstable release.
    # If you prefer a stable release instead, you can change the word unstable to the latest number shown here: https://nixos.org/download
    # i.e. nixos-24.11
    # Use `nix flake update` to update the flake to the latest revision of the chosen release channel.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia/cachix";
    };

    nix-flatpak = {
      url = "github:gmodena/nix-flatpak";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    qylock = {
      url = "github:Darkkal44/qylock";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    future-cursors = {
      url = "github:StarTheSus/Nix-Future-cursors";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    inputs@{
      self,
      nixpkgs,
      noctalia,
      home-manager,
      nix-flatpak,
      zen-browser,
      qylock,
      future-cursors,
      ...
    }:
    {
      nixosConfigurations.LOQ = nixpkgs.lib.nixosSystem {
        modules = [
          home-manager.nixosModules.home-manager
          nix-flatpak.nixosModules.nix-flatpak
          qylock.nixosModules.default
          ./hosts/LOQ/configuration.nix
          ./modules/packages/flatpak.nix
          ./modules/packages/zen.nix
        ];
        specialArgs = { inherit inputs; };
      };
    };
}
