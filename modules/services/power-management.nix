_: {
    flake.nixosModules.power-management = _: {
        services = {
            logind.settings.Login = {
                HandleLidSwitch = "ignore";
                HandleLidSwitchExternalPower = "ignore";
                HandleLidSwitchDocked = "ignore";
            };

            tuned.enable = true;
            upower.enable = true;
        };
    };
}
