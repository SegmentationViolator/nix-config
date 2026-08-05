_: {
    flake.nixosModules.graphics = _: {
        hardware.graphics.enable = true;

        services.xserver.videoDrivers = [ "modesetting" ];
    };
}
