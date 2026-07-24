{ self, ... }: {
    flake.nixosModules.nvidia = { ... }: {
        imports = [ self.nixosModules.graphics ];

        specialisation.nvidia.configuration = {
            imports = [ self.flakeModules.unfree-packages ];

            hardware = {
                graphics.enable = true;

                nvidia = {
                    open = true;

                    modesetting.enable = true;

                    powerManagement = {
                        enable = true;
                        finegrained = true;
                    };

                    prime = {
                        intelBusId = "PCI:0:2:0";
                        nvidiaBusId = "PCI:1:0:0";

                        offload = {
                            enable = true;
                            enableOffloadCmd = true;
                        };
                    };
                };
            };

            services.xserver.videoDrivers = [
                "modesetting"
                "nvidia"
            ];

            unfreePackages = [
                "nvidia-settings"
                "nvidia-x11"
            ];
        };
    };
}
