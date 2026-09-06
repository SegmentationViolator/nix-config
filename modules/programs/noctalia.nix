_: {
    flake.homeModules.noctalia = _: {
        nix.settings = {
            extra-substituters = [ "https://noctalia.cachix.org" ];
            extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
        };

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

                shell = {
                    polkit_agent = true;
                    screen_time_enabled = true;

                    panel = {
                        control_center_placement = "floating";
                        wallpaper_placement      = "floating";
                        session_placement        = "floating";
                    };
                };

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
