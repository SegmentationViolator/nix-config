_: {
    flake.homeModules.noctalia = _: {
        programs.noctalia = {
            enable = true;

            settings = {
                theme = {
                    mode = "dark";
                    source = "wallpaper";
                    wallpaperScheme = "m3-content";
                };

                wallpaper.enabled = true;
            };

            systemd.enable = true;
        };
    };
}
