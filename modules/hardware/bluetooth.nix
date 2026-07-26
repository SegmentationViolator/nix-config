_: {
    flake = {
        nixosModules.bluetooth = _: {
            hardware.bluetooth = {
                enable = true;

                settings.General = {
                    Experimental = true;
                    FastConnectable = true;
                };
            };
        };
    };
}
