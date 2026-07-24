_: {
    flake.nixosModules.doas = _: {
        security = {
            doas.enable = true;
            sudo.enable = false;
        };

        programs = {
            git.enable = true;
            command-not-found.enable = false;
        };
    };
}
