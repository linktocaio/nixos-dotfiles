{pkgs, ...}: {

  programs.btop = {
    enable = true;

    settings = {
      color_theme = "monokai";
    };
  };
}