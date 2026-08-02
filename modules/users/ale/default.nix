{ self, ... }: {
    flake.userModules.ale.nixos = { pkgs, ... }: {
        imports = [
            self.nixosModules.niri
            self.nixosModules.zsh
        ];

        users.mutableUsers = true;

        users.users.ale = {
            isNormalUser = true;
            extraGroups = [ "networkmanager" "wheel" ];
            shell = pkgs.zsh;
        };
    };

    flake.userModules.ale.home = { config, pkgs, ... }:
        let
            icon-theme = pkgs.papirus-icon-theme.override {
                color = "red";
            };
        in
        {
            imports = [
                self.homeModules.direnv
                self.homeModules.gh
                self.homeModules.ghostty
                self.homeModules.stremio-service
                self.homeModules.waybar
                self.homeModules.zsh
                self.homeModules.mako
            ];

            wallpaper = pkgs.fetchurl {
                url = "https://w.wallhaven.cc/full/l3/wallhaven-l3kjql.jpg";
                hash = "sha256-vEp1jA/UeQFnFMx8HtV6+KEMwU0nl9Ffa42VRf8ltRI=";
            };

            home = {
                username = "ale";
                homeDirectory = "/home/ale";

                packages = with pkgs; [
                    bottom
                    codex
                    devenv
                    fastfetch
                    mpv
                    motrix-next
                    nautilus
                    nur.repos.forkprince.helium-nightly
                    obs-studio
                    overskride
                    tor-browser
                    vesktop
                    wl-clipboard
                    xdg-utils

                    font-awesome
                    monaspace
                    noto-fonts
                    noto-fonts-cjk-sans
                    noto-fonts-color-emoji
                ];

                stateVersion = "26.11";
            };

            fonts.fontconfig.enable = true;

            gtk = {
                enable = true;
                colorScheme = "dark";
                gtk4.theme = config.gtk.theme;

                iconTheme = {
                    name = "Papirus";
                    package = icon-theme;
                };

                theme = {
                    name = "Colloid-Dark";
                    package = pkgs.colloid-gtk-theme;
                };
            };

            home.pointerCursor =
                let
                    getFrom = url: hash: name: {
                        inherit name;

                        enable = true;
                        dotIcons.enable = false;
                        gtk.enable = true;

                        size = 24;
                        package = pkgs.symlinkJoin {
                            inherit name;
                            paths = [];

                            postBuild = ''
                                mkdir -p $out/share/icons
                                ln -s ${pkgs.fetchzip { inherit url hash; }} $out/share/icons/${name}
                            '';
                        };
                    };
                in
                    getFrom
                        "https://github.com/SegmentationViolator/kafka-cursors/releases/download/v1.0/Kafka.tar.gz"
                        "sha256-9EKH8A66VrF20S9uSp9+e/qUfXOmBQF6GyycMFaWgiI="
                        "Kafka";

            home.preferXdgDirectories = true;

            programs = {
                ghostty.settings.font-family = "Monaspace Neon";

                git = {
                    enable = true;

                    settings = {
                        init.defaultBranch = "main";
                        user = {
                            name = "Segmentation Violator";
                            email = "segmentationviolator@proton.me";
                        };
                    };

                    signing = {
                        signByDefault = true;
                        key = "segmentationviolator@proton.me";
                    };
                };

                home-manager.enable = true;

                hyfetch = {
                    enable = true;

                    settings = {
                        preset = "transbian";
                        mode = "rgb";
                        light_dark = "dark";
                        lightness = 0.65;
                        backend = "fastfetch";
                        color_align = { mode = "horizontal"; };
                        pride_month_disable = false;
                    };
                };

                matugen = {
                    enable = true;
                    source_color_index = 0;

                    templates = {
                        niri = {
                            input_path = "${./niri.kdl}";
                            output_path = "~/niri.kdl";
                        };
                    };
                };

                nix-index.enable = true;
            };

            systemd.user.startServices = "sd-switch";

            xdg = {
                enable = true;

                configFile."autostart/com.stremio.service.desktop" = {
                    force = true;
                    text = "";
                };

                configFile."niri/config.kdl".source = config.programs.matugen.theme.files + "/niri.kdl";

                desktopEntries = {
                    bottom = {
                        name = "bottom";
                        noDisplay = true;
                    };
                };

                userDirs.enable = true;
            };
        };
}
