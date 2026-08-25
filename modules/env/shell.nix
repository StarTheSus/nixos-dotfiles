{ pkgs, ... }:

{
  programs = {
    zsh = {
      enable = true;
      histFile = "$HOME/.local/state/history";
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    zsh-autosuggestions
    zsh-fast-syntax-highlighting
  ];
}
