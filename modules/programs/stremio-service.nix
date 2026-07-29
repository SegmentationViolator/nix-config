_: {
    flake.homeModules.stremio-service = { pkgs, ... }: {
            home.packages = [ pkgs.stremio-service ];

            unfreePackages = [
                "stremio-server"
                "stremio-service"
            ];
        };
}
