{
  description = "A very basic flake";

  outputs = { self, nixpkgs }: {
    nixosModules = {
      plasma = import ./modules/plasma.nix;
      gnome = import ./modules/gnome.nix;
      fonts = import ./modules/fonts.nix;
      ibus = import ./modules/ibus.nix;
      waydroid = import ./modules/waydroid.nix;
      virt-manager = import ./modules/virt-manager.nix;
      distrobox = import ./modules/distrobox.nix;
    };
  };
}
