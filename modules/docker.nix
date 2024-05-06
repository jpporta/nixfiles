{ config, pkgs, ... }: {
  virtualisation.docker.enable = true;
  users.users.jpporta.extraGroups = [ "docker" ];
}
