{ pkgs, ... }:

{
	services.flatpak = {
		enable = true;
		packages = [
			"eu.betterbird.Betterbird"
		];
	};
}
