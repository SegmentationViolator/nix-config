_: {
    flake.homeModules.librewolf = _: {
        programs.librewolf = {
            enable = true;

            policies = {
                BlockAboutConfig = true;
                DefaultDownloadDirectory = "\${home}/Downloads";
                ExtensionSettings = {
                    "uBlock0@raymondhill.net" = {
                        default_area = "menupanel";
                        install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
                        installation_mode = "force_installed";
                        private_browsing = true;
                    };
                    "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
                        install_url = "https://addons.mozilla.org/firefox/downloads/latest/{446900e4-71c2-419f-a6a7-df9c091e268b}/latest.xpi";
                        installation_mode = "force_installed";
                    };
                };
                PasswordManagerEnabled = false;
            };

            settings = {
                "privacy.resistFingerprinting.letterboxing" = true;
            };
        };
    };
}
