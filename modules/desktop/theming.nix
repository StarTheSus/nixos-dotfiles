{ pkgs, ... }:

{
  # Qt System Integration
  # This acts exactly like setting QT_QPA_PLATFORMTHEME manually
  qt = {
    enable = true;
    platformTheme = "qt5ct";
    style = "kvantum";
  };

  environment.systemPackages = with pkgs; [
    libsForQt5.qt5ct
	kdePackages.qt6ct
	libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum
    nwg-look

	# Icons
	adwaita-icon-theme
  ];
}
