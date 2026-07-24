_: {
    flake.nixosModules.navidrome = _: {
        services.navidrome = {
            enable = true;

            openFirewall = false;

            settings = {
                MusicFolder = "/mnt/media/Music";

                Address = "127.0.0.1";
                Port = 4533;

                ScanSchedule = "@every 1h";
                EnableInsightsCollector = false;
            };
        };
    };
}
