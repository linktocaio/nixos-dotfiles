{
  pkgs,
  lib,
  ...
}: {
  imports = [./modules/kitty.nix];

  terminals.kitty = {
    enable = true;

    alias = ["xterm" "kgx" "gnome-terminal"];
    sessionVariable = true;

    settings = {
      enable_audio_bell = false;
      confirm_os_window_close = 1;
      mouse_hide_wait = -1;
      window_padding_width = 10;

      cursor_shape = "beam";
      allow_hyperlinks = "yes";

      shell = "zsh";
      font_family = "FiraCode Nerd Font";
      font_size = 12;

      background_opacity = "0.95";

      background = "#191919";

      selection_background = "#343434";
      
      foreground = "#c4c4b5";
      selection_foreground = "#191919";
      
      cursor = "#f6f6ec";
      
      #black
      color0 = "#191919";
      color8 = "#615e4b";
      #red
      color1 = "#f3005f";
      color9 = "#f3005f";
      #green
      color2 = "#97e023";
      color10 = "#97e023";
      #yellow
      color3 = "#fa8419";
      color11 = "#dfd561";
      #blue
      color4 = "#9c64fe";
      color12 = "#9c64fe";
      #magenta
      color5 = "#f3005f";
      color13 = "#f3005f";
      #cyan
      color6 = "#57d1ea";
      color14 = "#57d1ea";
      #white
      color7 = "#c4c4b5";
      color15 = "#f6f6ee";

      symbol_map = let
        mappings = [
          "U+23FB-U+23FE"
          "U+2B58"
          "U+E200-U+E2A9"
          "U+E0A0-U+E0A3"
          "U+E0B0-U+E0BF"
          "U+E0C0-U+E0C8"
          "U+E0CC-U+E0CF"
          "U+E0D0-U+E0D2"
          "U+E0D4"
          "U+E700-U+E7C5"
          "U+F000-U+F2E0"
          "U+2665"
          "U+26A1"
          "U+F400-U+F4A8"
          "U+F67C"
          "U+E000-U+E00A"
          "U+F300-U+F313"
          "U+E5FA-U+E62B"
        ];
        in
          (builtins.concatStringsSep "," mappings) + " Symbols Nerd Font";

    };  
  };
}
