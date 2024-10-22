{
  config,
  lib,
  ...
}: {
  options.laptop = {
    enable = lib.mkEnableOption "Laptop Configuration";
  };

  config = lib.mkIf config.laptop.enable {

    # razer
    hardware.openrazer.enable = true;
    boot.kernelParams = [ "button.lid_init_state=open" ];
    environment.systemPackages = with pkgs; [
      openrazer-daemon
      polychromatic
    ];

    # nvidia
    hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver # iHD
        intel-vaapi-driver # i965
      ];
    };
    environment.sessionVariables = { LIBVA_DRIVER_NAME = "i965"; };

    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {
      prime = {
        offload.enable = true;
        offload.enableOffloadCmd = true;
        nvidiaBusId = "PCI:1:0:0";
        intelBusId = "PCI:0:2:0";
      };

      modesetting.enable = true;

      powerManagement = {
        enable = true;
        finegrained = true;
      };

      open = true;
      nvidiaSettings = false; # gui app
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };
  };
}
