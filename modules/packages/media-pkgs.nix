{ pkgs, ... }:

{
  programs = {
    obs-studio = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    # Core FFmpeg
    ffmpeg-full

    # GStreamer
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
    
    # Audio & Media Libraries
    openal
    mpg123

    # Applications
    easyeffects
  ];
}
