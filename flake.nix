{
    inputs = {
        flake-parts.url = "github:hercules-ci/flake-parts";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        import-tree.url = "github:vic/import-tree";
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        nur = {
            url = "github:nix-community/NUR";
            inputs.nixpkgs.follows = "nixpkgs";
            inputs.flake-parts.follows = "flake-parts";
        };

        matugen = {
            url = "github:InioX/Matugen";
            inputs.nixpkgs.follows = "nixpkgs";
            inputs.systems.follows = "systems";
        };

        nix-index-database = {
            url = "github:nix-community/nix-index-database";
            inputs.nixpkgs.follows = "nixpkgs";
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

        systems.url = "github:nix-systems/x86_64-linux";
    };
    outputs = { flake-parts, import-tree, ... } @ inputs:
        flake-parts.lib.mkFlake { inherit inputs; } (import-tree ./modules);
}
