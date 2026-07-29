{ self, ... }: {
    flake.homeModules.stremio-service = { pkgs, ... }: {
            imports = [ self.flakeModules.unfree-packages ];
            home.packages = [ pkgs.stremio-service ];

            unfreePackages = [
                "stremio-server"
                "stremio-service"
            ];
        };
}
