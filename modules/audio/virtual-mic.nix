{ ... }:

{
  services.pipewire.extraConfig.pipewire."99-virtual-mic" = {
    "context.modules" = [
      {
        name = "libpipewire-module-loopback";
        args = {
          "node.description" = "Safe Mute Loopback";
          "node.name" = "safe_mute_loopback";
          "capture.props" = {
            # This is the internal stream we will mute
            # It connects directly to RNNoise output
            "node.name" = "safe_mute_in";
            "target.object" = "rnnoise_source";
            "session.suspend-timeout-seconds" = 0;
          };
          "playback.props" = {
            # This is the dummy source Discord/Equibop will connect to
            # We NEVER touch the mute property on this node
            "node.name" = "safe_mute_out";
            "media.class" = "Audio/Source";
            "audio.position" = [ "MONO" ];
            "session.suspend-timeout-seconds" = 0;
          };
        };
      }
    ];
  };
}
