{
  inputs,
  lib,
  pkgs,
  ...
}: let
  username = "caio";

in {
  imports = [
    /etc/nixos/hardware-configuration.nix

    ./system.nix
    ./audio.nix
    ./locale.nix
    ./nautilus.nix
    ./gpu.nix
    ./hyprland.nix
    # ./gnome.nix
  ];

  users.users.${username} = {
    description = "Nothing New Here";
    initialPassword = username;
    isNormalUser = true;

    # shell = pkgs.zsh;

    extraGroups = [
      #"nixosvmtest"
      "networkmanager"
      "wheel"
      "audio"
      "video"
      #"libvirtd"
      "docker"
      # "openrazer" #
    ];
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    useUserPackages = true;
    useGlobalPkgs = true;
    
    backupFileExtension = "backup";

    users.${username} = {
      home.username = username;
      home.homeDirectory = "/home/${username}";

      imports = [
        ./home.nix

        ../home-manager/hyprland.nix  
        ../home-manager/ags.nix
      
        ../home-manager/browser.nix
        
        ../home-manager/kitty.nix
        ../home-manager/btop.nix
        ../home-manager/sh.nix

        ../home-manager/git.nix
        ../home-manager/nvim.nix
        ../home-manager/vscode.nix
        
        ../home-manager/lf.nix

        ../home-manager/theme.nix
        ../home-manager/starship.nix
        
        ../home-manager/packages.nix

        # ../home-manager/blackbox.nix
        # ../home-manager/dconf.nix
        # ../home-manager/distrobox.nix
        #../home-manager/tmux.nix
        # ../home-manager/wezterm.nix
      ];
    };
  };

  hyprland.enable = true;
  gpu.enable = true;
  # specialisation = {
  #   gnome.configuration = {
  #     system.nixos.tags = ["Gnome"];
  #     hyprland.enable = lib.mkForce false;
  #     gnome.enable = true;
  #   };
  # };
}
