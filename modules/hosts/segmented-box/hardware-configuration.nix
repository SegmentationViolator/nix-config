_: {
    flake.hostModules.segmented-box = { config, lib, modulesPath, ... }: {
        imports = [
            (modulesPath + "/installer/scan/not-detected.nix")
        ];

        boot = {
            initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "sd_mod" ];
            initrd.kernelModules = [ ];
            kernelModules = [ "intel-kvm" ];
            extraModulePackages = [ ];
        };

        fileSystems = {
            "/" =
                { device = "/dev/disk/by-label/NIXROOT";
                    fsType = "ext4";
                };

            "/boot" =
                { device = "/dev/disk/by-label/NIXBOOT";
                    fsType = "vfat";
                    options = [ "fmask=0022" "dmask=0022" ];
                };

            "/mnt/media" =
                { device = "/dev/disk/by-label/Media";
                    fsType = "ntfs3";
                    options = [ "fmask=000" "dmask=000" ];
                };
        };

        swapDevices = [ ];

        hardware.enableRedistributableFirmware = true;
        hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}
