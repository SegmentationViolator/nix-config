_: { 
    flake.modules.generic.wallpaper = { lib, config, ... }: {
        config = {
            programs.matugen.wallpaper = config.wallpaper;

            programs.noctalia.settings.wallpaper = {
                enable = true;
                default.path = config.wallpaper;
            };
        };

        options.wallpaper = lib.mkOption {
            description = "Wallpaper image used by desktop.";
            type = lib.types.path;
        };
    };
}
