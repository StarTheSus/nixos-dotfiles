{ ... }:

{
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
    angrr = {
      enable = true;
      autoUse = true;
    };
    loadInNixShell = false;
  };
}
