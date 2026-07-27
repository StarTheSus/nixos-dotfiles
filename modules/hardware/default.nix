{ ... }:

{
  imports = [
    ./intel.nix
    ./nvidia.nix
	./bluetooth.nix
	./battery.nix
	./modprobe.nix
  ];
}
