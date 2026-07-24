_: {
    flake.hostModules.segmented-box = { config, lib, modulesPath, ... }: {
        imports = [
            (modulesPath + "/installer/scan/not-detected.nix")
        ];

        boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "sd_mod" ];
        boot.initrd.kernelModules = [ ];
        boot.kernelModules = [ "intel-kvm" ];
        boot.extraModulePackages = [ ];

        fileSystems."/" =
            { device = "/dev/disk/by-label/NIXROOT";
                fsType = "ext4";
            };

        fileSystems."/boot" =
            { device = "/dev/disk/by-label/NIXBOOT";
                fsType = "vfat";
                options = [ "fmask=0022" "dmask=0022" ];
            };

        fileSystems."/mnt/media" =
            { device = "/dev/disk/by-label/Media";
                fsType = "ntfs3";
            };

        swapDevices = [ ];

        hardware.enableRedistributableFirmware = true;
        hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}
