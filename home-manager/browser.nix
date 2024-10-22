{inputs, pkgs, lib, ...}: {
  home = {
    sessionVariables.BROWSER = "brave";
  };

  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      { id = "nffaoalbilbmmfgbnbgppjihopabppdk"; } # video speed controller
    ];
    commandLineArgs = [
      "--disable-features=WebRtcAllowInputVolumeAdjustment"
    ];
    # extraOpts = {
    #   "BrowserSignin" = 0;
    #   "SyncDisabled" = true;
    #   "MetricsReportingEnabled" = false;
    #   "SpellcheckEnabled" = true;
    #   "SpellcheckLanguage" = [
    #                            "pt-BR"
    #                            "en-US"
    #                          ];
    # };
    # homepageLocation = null;
    # initialPrefs = lib.literalExpression ''
    #   {
    #     "homepage_is_newtabpage": false,
    #     "browser": {
    #       "show_home_button": false
    #     },
    #   }
    # '';
  };

  # environment.sessionVariables.NIXOS_OZONE_WL = "1";
  # environment.systemPackages = with pkgs; [
  #   (chromium.override { enableWideVine = true; })
  # ];
}
