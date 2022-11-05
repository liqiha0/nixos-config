{
  description = "A very basic flake";

  outputs = { self, nixpkgs }: {
    nixosModules = {
      desktop = import ./desktop.nix;
      waydroid = import ./waydroid.nix;
      virt-manager = import ./virt-manager.nix;
    };
  };
}
