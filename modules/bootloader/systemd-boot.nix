_: {
    flake.nixosModules.systemd-boot = _: {
        boot.loader = {
            efi.canTouchEfiVariables = true;

            systemd-boot = {
                enable = true;
                editor = false;
            };
        };
    };
}
