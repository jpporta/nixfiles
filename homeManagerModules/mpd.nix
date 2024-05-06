{ config, pkgs, ... }: {
  services.mpd = {
    enable = true;
    musicDirectory = "/home/jpporta/music";
  };
}
