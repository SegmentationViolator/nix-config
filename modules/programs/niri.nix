_: {
    flake.nixosModules.niri = _: {
        environment.sessionVariables.NIXOS_OZONE_WL = "1";

        programs.niri.enable = true;

        security = {
            polkit.enable = true;
            rtkit.enable = true;
        };

        services.gnome.gnome-keyring.enable = true;

        xdg.portal = {
            enable = true;
            xdgOpenUsePortal = true;
        };
    };
}
