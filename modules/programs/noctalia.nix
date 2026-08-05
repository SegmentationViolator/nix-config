_: {
    flake.homeModules.noctalia = _: {
        programs.noctalia = {
            enable = true;

            settings = {
                backdrop.enabled = true;

                bar.default = {
                    start = [ "workspaces" "media" ];
                    center = [ "clock" ];
                    end = [ "privacy" "tray" "network" "volume" "battery" "notifications" ];
                };

                location.address = "Mumbai, MH, IN";

                theme = {
                    mode = "dark";
                    source = "wallpaper";
                    wallpaper_scheme = "m3-content";

                    templates = {
                        enable_builtin_templates = false;
                        enable_community_templates = false;
                    };
                };

                wallpaper = {
                    enabled = true;
                    transition_on_startup = true;
                };

                widget = {
                    clock = {
                        format = "%e %b %H:%M";
                        tooltip_format = "%A";
                    };

                    media = {
                        hide_when_no_media = true;
                        titleScroll = true;
                    };

                    network = {
                        show_label = false;
                    };

                    privacy = {
                        hide_inactive = true;
                    };

                    volume = {
                        show_label = false;
                    };
                };
            };

            systemd.enable = true;
        };
    };
}
