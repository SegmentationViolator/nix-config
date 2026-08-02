_: {
    flake.nixosModules.zsh = { pkgs, ... }: {
        environment.shells = with pkgs; [
            zsh
        ];

        programs.zsh.enable = true;
    };

    flake.homeModules.zsh = { lib, ... }: {
        programs.zsh = {
            enable = true;

            autosuggestion.enable = true;
            enableCompletion = true;
            fastSyntaxHighlighting.enable = true;

            history = {
                ignoreAllDups = true;
                ignoreSpace = true;
                save = 10000;
                size = 10000;
            };

            historySubstringSearch = {
                enable = true;
                searchDownKey = "$terminfo[kcud1]";
                searchUpKey = "$terminfo[kcuu1]";
            };

            initContent = lib.mkOrder 550 ''
                HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="underline"
                HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=""
            '';
        };
    };
}
