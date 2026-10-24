_: {
    flake.nixosModules.run0 = _: {
        security = {
            run0.enable = true;
            sudo.enable = false;
        };
    };
}
