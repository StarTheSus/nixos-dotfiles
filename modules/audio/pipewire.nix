{ config, pkgs, ... }:

{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    # 1. Main PipeWire configuration
    extraConfig.pipewire = {
      "10-rates" = {
        "context.properties" = {
          "default.clock.rate" = 48000;
          "default.clock.allowed-rates" = [
            44100
            48000
            88200
            96000
            192000
          ];
          "default.clock.quantum" = 1024;
          "default.clock.min-quantum" = 1024;
          "default.clock.max-quantum" = 8192;
        };
      };
    };

    # 2. WirePlumber configuration
    wireplumber = {
      enable = true;
      extraConfig = {
        "10-bluez" = {
          "monitor.bluez.properties" = {
            "bluez5.enable-sbc-xq" = true;
            "bluez5.enable-msbc" = true;
            "bluez5.codecs" = [
              "sbc"
              "sbc-xq"
            ];
          };
        };

        "11-disable-camera" = {
          "wireplumber.profiles" = {
            main = {
              "monitor.libcamera" = "disabled";
            };
          };
        };

        "12-disable-suspension" = {
          "monitor.alsa.rules" = [
            {
              matches = [
                { "node.name" = "~alsa_input.*"; }
                { "node.name" = "~alsa_output.*"; }
              ];
              actions = {
                update-props = {
                  "session.suspend-timeout-seconds" = 0;
                };
              };
            }
          ];
          "monitor.bluez.rules" = [
            {
              matches = [
                { "node.name" = "~bluez_input.*"; }
                { "node.name" = "~bluez_output.*"; }
              ];
              actions = {
                update-props = {
                  "session.suspend-timeout-seconds" = 0;
                };
              };
            }
          ];
        };
      };
    };

    # 3. PulseAudio Quirks
    extraConfig.pipewire-pulse = {
      "10-source-volumes" = {
        "pulse.rules" = [
          {
            matches = [
              { application.name = "~Chromium.*"; }
            ];
            actions = {
              quirks = [ "block-source-volume" ];
            };
          }
          {
            matches = [
              { "application.process.binary" = "Discord"; }
              { "application.process.binary" = "equibop"; }
            ];
            actions = {
              quirks = [ "block-source-volume" ];
            };
          }
        ];
      };
    };
  };
}
