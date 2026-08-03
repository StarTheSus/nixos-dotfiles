{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (writeShellScriptBin "splitlock-toggle" (builtins.readFile ./splitlock-toggle.sh))
    # Future scripts go here
  ];
}
