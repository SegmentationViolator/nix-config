{ self, inputs, lib, ... }: {
    options.flake.hostModules = lib.mkOption {
        type = lib.types.lazyAttrsOf lib.types.deferredModule;
        default = {};
        description = "Reusable host-level NixOS modules.";
    };

    imports = [ 
        inputs.flake-parts.flakeModules.modules
        inputs.home-manager.flakeModules.home-manager
    ];

    config = {
        systems = import inputs.systems;

        flake = 
            let 
                system = builtins.head (import inputs.systems);
            in
            {
                homeConfigurations."ale" =
                    inputs.home-manager.lib.homeManagerConfiguration {
                        pkgs = import inputs.nixpkgs {
                            inherit system;

                            overlays = [
                                inputs.nur.overlays.default
                            ];
                        };

                        modules = [
                                self.userModules.ale.home
                                inputs.matugen.nixosModules.default
                                inputs.nix-index-database.homeModules.default
                                (_: {
                                    home.packages = [
                                        inputs.nvf-config.packages.${system}.default
                                    ];
                                })
                            ];
                    };

                nixosConfigurations."segmented-box" = inputs.nixpkgs.lib.nixosSystem {
                    inherit system;

                    modules = [ self.hostModules.segmented-box ];
                };
            };
    };
}
