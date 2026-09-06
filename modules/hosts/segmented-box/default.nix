{ inputs, self, ... }: {
    flake.hostModules.segmented-box = { pkgs, ... }: {
        imports = [
            inputs.bluevein.nixosModules.default

            self.nixosModules.systemd-boot

            self.nixosModules.bluetooth
            self.nixosModules.networking
            self.nixosModules.nvidia
            self.nixosModules.audio

            self.nixosModules.doas

            self.nixosModules.power-management

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

        services.bluevein.enable = true;

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

            trusted-users = [ "@wheel" ];
        };

        system.stateVersion = "26.11";
    };
}
