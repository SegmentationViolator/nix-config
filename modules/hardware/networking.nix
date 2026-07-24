_: {
    flake.nixosModules.networking = { lib, ... }: {
        networking = {
            dhcpcd.enable = false;
            useDHCP = false;

            nftables.enable = true;

            networkmanager = {
                enable = true;
                dns = "systemd-resolved";
            };

            nameservers = lib.mkDefault [
                "1.1.1.1"
                "1.0.0.1"
            ];
        };

        services.resolved = {
            enable = true;

            settings.Resolve = {
                DNSSEC = "allow-downgrade";
                LLMNR = false;
                DNSOverTLS = "opportunistic";

                FallbackDNS = [
                    "8.8.8.8"
                    "8.8.4.4"
                ];
            };
        };
    };
}
