{
  inputs,
  pkgs,
  lib,
  ...
}:
let
  extension = shortId: guid: {
    name = guid;
    value = {
      install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
      installation_mode = "normal_installed";
    };
  };

  prefs = {
    # Check these out at about:config
    "extensions.autoDisableScopes" = 0;
    "extensions.pocket.enabled" = false;
	"browser.theme.dark-private-windows" = true;
  };

  extensions = [
    # To add additional extensions, find it on addons.mozilla.org, find
    # the short ID in the url (like https://addons.mozilla.org/en-US/firefox/addon/!SHORT_ID!/)
    # Then go to https://addons.mozilla.org/api/v5/addons/addon/!SHORT_ID!/ to get the guid
    (extension "ublock-origin" "uBlock0@raymondhill.net")
	(extension "bitwarden-password-manager" "{446900e4-71c2-419f-a6a7-df9c091e268b}" )
	(extension "darkreader" "addon@darkreader.org" )
	(extension "vimium-c" "vimium-c@gdh1995.cn" )
	(extension "styl-us" "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" )
	(extension "w2g" "{6ea0a676-b3ef-48aa-b23d-24c8876945fb}" )
	(extension "foxyproxy-standard" "foxyproxy@eric.h.jung" )
	(extension "return-youtube-dislikes" "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" )
	(extension "youtube-anti-translate" "{458160b9-32eb-4f4c-87d1-89ad3bdeb9dc}" )
	(extension "videospeed" "{7be2ba16-0f1e-4d93-9ebc-5164397477a9}" )
	(extension "fastforwardteam" "addon@fastforward.team" )
	(extension "proton-vpn-firefox-extension" "vpn@proton.ch" )
  ];

in
{
  environment.systemPackages = [
    (pkgs.wrapFirefox
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.zen-browser-unwrapped
      {
        extraPrefs = lib.concatLines (
          lib.mapAttrsToList (
            name: value: ''lockPref(${lib.strings.toJSON name}, ${lib.strings.toJSON value});''
          ) prefs
        );

        extraPolicies = {
          DisableTelemetry = true;
          ExtensionSettings = builtins.listToAttrs extensions;

          SearchEngines = {
            Default = "ddg";
            Add = [
              {
                Name = "nixpkgs packages";
                URLTemplate = "https://search.nixos.org/packages?query={searchTerms}";
                IconURL = "https://wiki.nixos.org/favicon.ico";
                Alias = "@np";
              }
              {
                Name = "NixOS options";
                URLTemplate = "https://search.nixos.org/options?query={searchTerms}";
                IconURL = "https://wiki.nixos.org/favicon.ico";
                Alias = "@no";
              }
              {
                Name = "NixOS Wiki";
                URLTemplate = "https://wiki.nixos.org/w/index.php?search={searchTerms}";
                IconURL = "https://wiki.nixos.org/favicon.ico";
                Alias = "@nw";
              }
              {
                Name = "noogle";
                URLTemplate = "https://noogle.dev/q?term={searchTerms}";
                IconURL = "https://noogle.dev/favicon.ico";
                Alias = "@ng";
              }
            ];
          };
        };
      }
    )
  ];
}
