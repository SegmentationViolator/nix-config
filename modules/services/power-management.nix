_: {
    flake.nixosModules.power = _: {
        services.logind.settings.Login = {
            HandleLidSwitch = "suspend";
            HandleLidSwitchExternalPower = "lock";
            HandleLidSwitchDocked = "ignore";
        };

        services = {
            thermald.enable = true;

            tlp = {
                enable = true;

                settings = {
                    PLATFORM_PROFILE_ON_AC = "performance";
                    PLATFORM_PROFILE_ON_BAT = "balanced";

                    CPU_BOOST_ON_AC = 1;
                    CPU_BOOST_ON_BAT = 0;
                };
            };
        };
    };
}
