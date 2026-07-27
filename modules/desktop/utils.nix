{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		desktop-file-utils
	];
}
