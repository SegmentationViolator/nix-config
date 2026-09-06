{
    inputs = {
        bluevein = {
            url = "github:meowrch/BlueVein";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        flake-parts.url = "github:hercules-ci/flake-parts";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        import-tree.url = "github:vic/import-tree";

        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        nix-index-database = {
            url = "github:nix-community/nix-index-database";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        noctalia.url = "github:noctalia-dev/noctalia/cachix";

        nur = {
            url = "github:nix-community/NUR";
            inputs.nixpkgs.follows = "nixpkgs";
            inputs.flake-parts.follows = "flake-parts";
        };

        nvf-config = {
            url = "github:SegmentationViolator/nvf-config";
            inputs = {
                flake-parts.follows = "flake-parts";
                import-tree.follows = "import-tree";
                nixpkgs.follows = "nixpkgs";
                systems.follows = "systems";
            };
        };

        splayer-next = {
            url = "github:SegmentationViolator/SPlayer-Next/feat/flake";
            inputs = {
                nixpkgs.follows = "nixpkgs";
                systems.follows = "systems";
            };
        };

        systems.url = "github:nix-systems/x86_64-linux";
    };

    outputs = { flake-parts, import-tree, ... } @ inputs:
        flake-parts.lib.mkFlake { inherit inputs; } (import-tree ./modules);
}
