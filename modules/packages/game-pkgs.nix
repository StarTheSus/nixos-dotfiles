{ pkgs, ... }:

{
  environment.sessionVariables = {
    GST_PLUGIN_SYSTEM_PATH_1_0 = pkgs.lib.makeSearchPathOutput "lib" "lib/gstreamer-1.0" (
      with pkgs;
      [
        gst_all_1.gst-plugins-base
        gst_all_1.gst-plugins-good
        gst_all_1.gst-plugins-bad
        gst_all_1.gst-plugins-ugly
        gst_all_1.gst-libav

        # 32-bit plugins
        pkgsi686Linux.gst_all_1.gst-plugins-base
        pkgsi686Linux.gst_all_1.gst-plugins-good
        pkgsi686Linux.gst_all_1.gst-plugins-bad
        pkgsi686Linux.gst_all_1.gst-plugins-ugly
        pkgsi686Linux.gst_all_1.gst-libav
      ]
    );
  };

  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      protontricks.enable = true;
      extraPackages = with pkgs; [
        gst_all_1.gst-plugins-ugly
        gst_all_1.gst-plugins-bad
        gst_all_1.gst-plugins-good
        gst_all_1.gst-libav
      ];
    };
    gamescope = {
      enable = true;
      # Required for HDR to work properly in Niri/Wayland
      enableWsi = true;
    };
  };

  environment.systemPackages = with pkgs; [
    wineWow64Packages.stagingFull
    winetricks
    protonplus
    mangohud
    heroic
    (heroic.override {
      extraPkgs = pkgs: [
        pkgs.gst_all_1.gstreamer
        pkgs.gst_all_1.gst-plugins-base
        pkgs.gst_all_1.gst-plugins-good
        pkgs.gst_all_1.gst-plugins-bad
        pkgs.gst_all_1.gst-plugins-ugly
        pkgs.gst_all_1.gst-libav
        pkgs.vulkan-loader
        pkgs.vulkan-tools
        pkgs.vulkan-validation-layers
        pkgs.vkd3d
        pkgs.vkd3d-proton
      ];
    })
  ];
}
