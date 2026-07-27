{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (writeShellScriptBin "flakenv" (builtins.readFile ./flakenv.sh))
    (writeShellScriptBin "stargit" (builtins.readFile ./stargit.sh))

    # Future coding scripts go here:
    # (writeShellScriptBin "build-runner" (builtins.readFile ./build-runner.sh))
  ];
  # home.packages = [
  #   (import ./flakenv.nix { inherit pkgs; })
  #   (import ./stargit.nix { inherit pkgs; })
  #   # Future coding scripts go here:
  #   # (import ./build-runner.nix { inherit pkgs; })
  # ];
}
