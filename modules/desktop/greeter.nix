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
        path = "${inputs.future-cursors.packages.${pkgs.system}.cyan}/share/icons";
      };
      keyboard = {
        layout = "us,ar";
      };
      appearance = {
        hide_logo = true;
        # font_family = "Inter"; # TODO
        # This might sync and get removed, or need to be defined
        # If it does need to be define for certain widgets or smth, I'll do it
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
