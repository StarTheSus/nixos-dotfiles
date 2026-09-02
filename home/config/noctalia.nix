{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  home.packages = with pkgs; [
    gpu-screen-recorder
  ];

  programs.noctalia = {
    enable = true;
  };
}
