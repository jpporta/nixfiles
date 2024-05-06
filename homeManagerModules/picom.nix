{ config, ... }: {
  services.picom = {
    enable = true;
    vSync = true;
    settings = {
      corner-radius = 16;
    };
  };
}
