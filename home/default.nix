{ config, pkgs, ... }:

{
  imports = [
    ./services
    ./scripts
    ./config
  ];

  programs.home-manager.enable = true;

  home = {
    username = "star";
    homeDirectory = "/home/star";
    stateVersion = "26.05";
    preferXdgDirectories = true;
    enableNixpkgsReleaseCheck = true;
    # file = {
    #     ".local/bin" = {
    #         source = ./files/bin;
    #         recursive = true;
    #     };
    #     ".local/share/menus" = {
    #         source = ./files/menus;
    #         recursive = true;
    #     };
    # };
  };
}
