{
  config,
  lib,
  pkgs,
  ...
}: {
  options.gpu = {
    enable = lib.mkEnableOption "dGPU Configuration";
  };

  config = lib.mkIf config.gpu.enable {
    # OpenGL ----------------
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        libva
        libva-utils
        libvdpau

        vdpauinfo
        vaapiVdpau
        libvdpau-va-gl
        
        nvidia-vaapi-driver

        # intel-media-driver # iHD
        # intel-vaapi-driver # i965
      ];
  	};
    # environment.sessionVariables = { LIBVA_DRIVER_NAME = "i965"; };

    # nvidia ----------------
    services.xserver.videoDrivers = ["nvidia"]; # activates for X11 and WL 
    boot.kernelParams = [ "module_blacklist=i915" ];

    hardware.nvidia = {
      modesetting.enable = true; # required on WL

      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.stable;

      nvidiaSettings = false; # gui app

      prime = {
        # offload <=> !sync

        # offload = {
        #   enable = true;
        #   enableOffloadCmd = true;
        # }; # dGPU on demand

        sync.enable = true; # dGPU aways on

        nvidiaBusId = "PCI:1:0:0";
        intelBusId = "PCI:0:2:0";
      };

      nvidiaPersistenced = false;

      powerManagement = {
        enable = false;
        finegrained = false;
      };
    };
  };
}
