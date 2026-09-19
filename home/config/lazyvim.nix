{ config, pkgs, ... }:

{
  xdg.desktopEntries.lazyvim = {
    name = "LazyVim";
    genericName = "Text Editor";
    exec = "kitty -e env NVIM_APPNAME=lazyvim nvim %F";
    terminal = false;
    type = "Application";
    categories = [ "Utility" "TextEditor" ];
    mimeType = [ "text/plain" ];
  };
}
