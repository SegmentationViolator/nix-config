{ self, inputs, lib, ... }: {
    options.flake = {
        hostModules = lib.mkOption {
            type = lib.types.lazyAttrsOf lib.types.deferredModule;
            default = {};
            description = "Reusable host-level NixOS modules.";
        };

        userModules = lib.mkOption {
            type = lib.types.lazyAttrsOf (lib.types.submodule {
                options = {
                    home = lib.mkOption {
                        type = lib.types.deferredModule;
                        default = {};
                    };
                    nixos = lib.mkOption {
                        type = lib.types.deferredModule;
                        default = {};
                    };
                };
            });
            default = {};
            description = "Reusable user-level modules.";
        };
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
                                self.modules.generic.unfree-packages

                                self.userModules.ale.home

                                inputs.nix-index-database.homeModules.default
                                inputs.noctalia.homeModules.default

                                (_: {
                                    programs.neovim = {
                                        enable = true;
                                        package = inputs.nvf-config.packages.${system}.default;
                                        defaultEditor = true;
                                    };

                                    home.packages = [ inputs.splayer-next.packages.${system}.default ];
                                })
                            ];
                    };

                nixosConfigurations."segmented-box" = inputs.nixpkgs.lib.nixosSystem {
                    inherit system;

                    modules = [
                        self.modules.generic.unfree-packages
                        self.hostModules.segmented-box
                    ];
                };
            };
    };
}
