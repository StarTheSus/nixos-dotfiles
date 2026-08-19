{ pkgs, ... }:

{
  programs = {
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
    };
  };

  services = {
    emacs = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    antigravity-ide
  ];
}
