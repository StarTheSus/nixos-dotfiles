{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
	noto-fonts-color-emoji
	nerd-fonts.symbols-only
    jetbrains-mono
	dejavu_fonts
	ibm-plex
	amiri
	font-awesome
  ];
}
