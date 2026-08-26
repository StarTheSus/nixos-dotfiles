{ inputs, pkgs, ... }:

{
  qt.enable = true;

  stylix = {
    enable = true;
    autoEnable = true;
    overlays.enable = false;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    targets.plymouth.enable = false; # leave my hexagons alone
    targets.grub.enable = false; # leave my cybergrub alone
    # Wallpaper is defined in noctalia, no need for anything else
    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
    icons = {
      enable = true;
      package = pkgs.adwaita-icon-theme;
      dark = "Adwaita";
      light = "Adwaita";
    };
    cursor = {
      package = inputs.future-cursors.packages.${pkgs.stdenv.hostPlatform.system}.default;
      name = "Future-cyan-cursors";
      size = 24;
    };
    opacity = {
      popups = 0.70;
      terminal = 0.85;
      applications = 1.0;
    };
  };
}
