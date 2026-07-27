{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.rnnoise-plugin ];

  # Inject the configuration fragment into PipeWire
  services.pipewire.extraConfig.pipewire."99-rnnoise" = {
    "context.modules" = [
      {
        name = "libpipewire-module-filter-chain";
        args = {
          "node.description" = "Noise Canceling Mic (RNN)";
          "media.name" = "Noise Canceling Mic (RNN)";
          "filter.graph" = {
            nodes = [
              {
                type = "ladspa";
                name = "rnnoise";
                plugin = "${pkgs.rnnoise-plugin}/lib/ladspa/librnnoise_ladspa.so";
                label = "noise_suppressor_mono";
                control = {
                  "VAD Threshold (%)" = 85.0;
                };
              }
            ];
          };
          "capture.props" = {
            "node.name" = "capture.rnnoise_source";
            "node.passive" = false; # true makes it sleep, equibop hates that
          };
          "playback.props" = {
            "node.name" = "rnnoise_source";
            "media.class" = "Audio/Source";
          };
        };
      }
    ];
  };
}
