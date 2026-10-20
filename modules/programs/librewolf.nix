_: {
    flake.homeModules.librewolf = _: {
        programs.librewolf = {
            enable = true;

            policies = {
                ExtensionSettings = {
                    "nova-flame@mozilla.org" = {
                        installation_mode = "force_installed";
                    };
                    "uBlock0@raymondhill.net" = {
                        default_area = "menupanel";
                        installation_mode = "force_installed";
                        private_browsing = true;
                    };
                    "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
                        installation_mode = "force_installed";
                    };
                };
                PasswordManagerEnabled = false;
            };

            settings = {
                "extensions.activeThemeID" = "nova-flame@mozilla.org";
                "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;

                "privacy.resistFingerprinting" = false;
                "privacy.fingerprintingProtection" = true;
                "privacy.fingerprintingProtection.overrides" = "+AllTargets,-CSSPrefersColorScheme";
            };
        };
    };
}
