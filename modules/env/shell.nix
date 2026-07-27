{ config, pkgs, ... }:

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
    # XDG
    xdg-utils
    xdg-user-dirs

    # Shell
	zsh-autosuggestions
	zsh-fast-syntax-highlighting
  ];
}
