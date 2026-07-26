{ inputs, self, ... }: {
    flake.hostModules.segmented-box = { pkgs, ... }: {
        imports = [
            inputs.bluevein.nixosModules.default

            self.nixosModules.systemd-boot

            self.nixosModules.backlight
            self.nixosModules.bluetooth
            self.nixosModules.networking
            self.nixosModules.nvidia
            self.nixosModules.audio

            self.nixosModules.doas

            self.nixosModules.navidrome
            self.nixosModules.power

            self.userModules.ale.nixos
        ];

        boot = {
            kernelPackages = pkgs.linuxPackages_latest;

            binfmt.emulatedSystems = [
                "aarch64-linux"
                "riscv64-linux"
            ];
        };

        documentation.nixos.enable = false;

        environment.systemPackages = with pkgs; [
            bat
            eza
        ];

        i18n.defaultLocale = "en_US.UTF-8";

        networking.hostName = "segmented-box";

        programs = {
            git.enable = true;
            gnupg.agent.enable = true;
        };

        services.bluevein = {
            enable = true;
            efiDevice = "/dev/disk/by-label/WINBOOT";
        };

        time.timeZone = "Asia/Kolkata";

        nix.settings = {
            experimental-features = [
                "nix-command"
                "flakes"
            ];

            extra-platforms = [
                "aarch64-linux"
                "riscv64-linux"
            ];
        };

        system.stateVersion = "26.11";
    };
}
