{
  pkgs,
  config,
  lib,
  ...
}: let
  inherit (lib) types;
  inherit (lib.modules) mkIf;
  inherit (lib.options) mkOption mkEnableOption;
  inherit (lib.strings) sanitizeDerivationName;

  cfg = config.terminals.kitty;
in {
  options.terminals.kitty = {
    enable = mkEnableOption "kitty";
    
    shellIntegration.enableZshIntegration = true;
    shell = "${pkgs.zsh}/bin/zsh";
    
    alias = mkOption {
      type = types.listOf types.str;
      default = [];
    };
    sessionVariable = mkOption {
      type = types.bool;
      default = [];
    };
    colors = mkOption {
      type = types.attrs;
      default = {};
    };
    settings = mkOption {
      type = types.attrs;
      default = {};
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = let
        term = ''${pkgs.kitty}/bin/kitty $@'';
        aliases = map (n: pkgs.writeShellScriptBin n term) cfg.alias;
      in
        [pkgs.kitty] ++ aliases;

      sessionVariables.TERMINAL = mkIf cfg.sessionVariable "kitty";

      # file = let
      #   mkScheme = name: {
      #     ".local/share/kitty-themes/themes/${sanitizeDerivationName name}.conf" = {
      #       text = builtins.toJSON (cfg.colors.${name} // {inherit name;});
      #     };
      #   };
      # in
      #   builtins.foldl' (acc: x: acc // x) {} (map mkScheme (builtins.attrNames cfg.colors));
    };

    dconf.settings = {
      "com/github/kovidgoyal/kitty" = cfg.settings;
      "com/github/stunkymonkey/nautilus-open-any-terminal".terminal = "kitty";
    };
  };
}
