_: {
    flake.nixosModules.zsh = { pkgs, ... }: {
        environment.shells = with pkgs; [
            zsh
        ];

        programs.zsh.enable = true;
    };

    flake.homeModules.zsh = _: {
        programs.zsh = {
            enable = true;

            autosuggestion.enable = true;
            enableCompletion = true;
            syntaxHighlighting.enable = true;

            history = {
                ignoreAllDups = true;
                ignoreSpace = true;
                save = 10000;
                size = 10000;
            };
        };
    };
}
