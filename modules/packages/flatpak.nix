{ ... }:

{
  services.flatpak = {
    enable = true;
    packages = [
      "eu.betterbird.Betterbird"
      "org.kde.okular"
      "com.github.tchx84.Flatseal"
    ];
  };
}
