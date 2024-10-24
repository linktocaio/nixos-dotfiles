{
  pkgs,
  config,
  lib,
  ...
}: let
  aliases = {
    "db" = "distrobox";
    "tree" = "eza --tree";
    "nv" = "nvim";

    "l"  = "eza --icons";
    "la" = "eza -a --group-directories-first --icons";
    "ld" = "eza -lD --icons" ;
    "lf" = "eza -lf --color=always | grep -v / --icons" ;
    "lh" = "eza -dl .* --group-directories-first --icons" ;
    "ll" = "eza -al --group-directories-first --icons" ;
    "ls" = "eza -alf --color=always --sort=size | grep -v / --icons" ;
    "lt" = "eza -al --sort=modified --icons" ;

    ":q" = "exit";
    "q" = "exit";

    "gs" = "git status";
    "gb" = "git branch";
    "gch" = "git checkout";
    "gc" = "git commit";
    "ga" = "git add";
    "gr" = "git reset --soft HEAD~1";

    "del" = "gio trash";

    "~" = "cd ~";
    ".." = "cd ..";
  };
in {
  options.shellAliases = with lib; mkOption {
    type = types.attrsOf types.str;
    default = {};
  };

  config.programs = {
    zsh = {
      enable = true;
      
      shellAliases = aliases // config.shellAliases;

      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      initExtra = ''
        SHELL=${pkgs.zsh}/bin/zsh
        zstyle ':completion:*' menu select
        bindkey "^[[1;5C" forward-word
        bindkey "^[[1;5D" backward-word
        unsetopt BEEP
      '';
    };

    bash = {
      shellAliases = aliases // config.shellAliases;
      enable = true;
      initExtra = "SHELL=${pkgs.bash}";
    };
  };

  # environment.shells = with pkgs; [ zsh bash];
  # users.defaultUserShell = pkgs.zsh;
}
