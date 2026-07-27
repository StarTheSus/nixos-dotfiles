{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (writeShellScriptBin "flakenv" (builtins.readFile ./flakenv.sh))
    (writeShellScriptBin "stargit" (builtins.readFile ./stargit.sh))
    # Future coding scripts go here:
    # (writeShellScriptBin "build-runner" (builtins.readFile ./build-runner.sh))
  ];
}
