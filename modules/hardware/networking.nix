_: {
    flake.nixosModules.networking = { lib, ... }: {
        networking = {
            dhcpcd.enable = false;
            useDHCP = false;

            nftables.enable = true;

            networkmanager = {
                enable = true;
                dns = "none";
            };

            nameservers = lib.mkDefault [
                "1.1.1.1"
                "1.0.0.1"
            ];
        };
    };
}
