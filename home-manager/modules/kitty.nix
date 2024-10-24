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
    programs.kitty = {
      enable = true;
      settings = cfg.settings;
    };

    home = {
      packages = let
        term = ''${pkgs.kitty}/bin/kitty $@'';
        aliases = map (n: pkgs.writeShellScriptBin n term) cfg.alias;
      in
        [pkgs.kitty] ++ aliases;

      sessionVariables.TERMINAL = mkIf cfg.sessionVariable "kitty";
    };

    dconf.settings = {
      "com/github/stunkymonkey/nautilus-open-any-terminal".terminal = "kitty";
    };
  };
}
