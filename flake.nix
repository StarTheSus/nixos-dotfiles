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

    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak = {
      url = "github:gmodena/nix-flatpak";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mangowm = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # My flakes
    future-cursors = {
      url = "github:StarTheSus/Nix-Future-cursors";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    anurati-font = {
      # priv flake forever
      url = "git+ssh://git@github-star/StarTheSus/Nix-ANURATI-free-font.git";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    cybergrub-2077 = {
      url = "github:StarTheSus/CyberGRUB-2077-Nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    inputs@{
      self,
      nixpkgs,
      noctalia,
      noctalia-greeter,
      home-manager,
      nix-flatpak,
      zen-browser,
      stylix,
      future-cursors,
      anurati-font,
      cybergrub-2077,
      ...
    }:
    {
      nixosConfigurations.LOQ = nixpkgs.lib.nixosSystem {
        modules = [
          home-manager.nixosModules.home-manager
          nix-flatpak.nixosModules.nix-flatpak
          stylix.nixosModules.stylix
          ./hosts/LOQ/configuration.nix
          ./modules/packages/flatpak.nix
          ./modules/packages/zen.nix
        ];
        specialArgs = { inherit inputs; };
      };
    };
}
