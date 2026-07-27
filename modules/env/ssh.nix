{ pkgs, config, lib, ... }:

{
	services.openssh.enable = true;

	systemd.services.sshd.wantedBy = lib.mkForce [];
}
