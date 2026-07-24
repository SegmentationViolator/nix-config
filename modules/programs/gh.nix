_: {
    flake.homeModules.gh = _: {
        programs.gh = {
            enable = true;

            settings = {
                prompt = "enabled";
                color_labels = "enabled";
                spinner = "enabled";
            };
        };
    };
}
