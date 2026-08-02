_: { 
    flake.flakeModules.wallpaper = { lib, config, ... }: {
        config = {
            programs.matugen.wallpaper = config.wallpaper;

            programs.noctalia.wallpaper = {
                enable = true;
                default.wallpaper = config.wallpaper;
            };
        };

        options.wallpaper = lib.mkOption {
            description = "Wallpaper image used by desktop.";
            type = lib.types.path;
        };
    };
}
