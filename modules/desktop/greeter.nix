{ pkgs, inputs, ... }:

{
  imports = [
    inputs.noctalia-greeter.nixosModules.default
  ];

  programs.noctalia-greeter = {
    enable = true;

    # Optional configuration
    greeter-args = "";
    settings = {
      cursor = {
        theme = "Future-cyan-cursors";
        size = 24;
        path = "${inputs.future-cursors.packages.${pkgs.stdenv.hostPlatform.system}.cyan}/share/icons";
      };
      keyboard = {
        layout = "us,ar";
      };
      appearance = {
        hide_logo = true;
        password_style = "random";
      };
      user = {
        default = "star";
      };
      session = {
        default = "Niri";
      };
    };
  };
}
