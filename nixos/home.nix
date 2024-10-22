{config, ...}: {
  news.display = "show";

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    warn-dirty = false;
  };

  home = {
    sessionVariables = {
      NIXPKGS_ALLOW_UNFREE = "1";
      NIXPKGS_ALLOW_INSECURE = "1";
      
      NIXOS_OZONE_WL = "1";

      GOPATH = "${config.home.homeDirectory}/.local/share/go";
      GOMODCACHE = "${config.home.homeDirectory}/.cache/go/pkg/mod";
      
      BAT_THEME = "base16";
      #QT_XCB_GL_INTEGRATION = "none"; # kde-connect
    };

    sessionPath = [
      "$HOME/.local/bin"
    ];
  };

  gtk.gtk3.bookmarks = let
    home = config.home.homeDirectory;
  in [
    "file://${home}/Documents"
    # "file://${home}/Music"
    "file://${home}/Pictures"
    # "file://${home}/Videos"
    "file://${home}/Downloads"
    "file://${home}/Desktop"
    #"file://${home}/Work"
    #"file://${home}/Projects"
    #"file://${home}/Vault"
    #"file://${home}/School"
    "file://${home}/.config Config"
  ];

  #services = {
  #  kdeconnect = {
  #    enable = true;
  #    indicator = true;
  #  };
  #};

  programs.home-manager.enable = true;
  home.stateVersion = "21.11";
}
