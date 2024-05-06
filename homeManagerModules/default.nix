{ config, pkgs, ... }: {
  imports = [
    ./zsh.nix
    ./kitty.nix
    ./packages.nix
    ./theming.nix
    ./git.nix
    ./mpd.nix
    ./picom.nix
  ];
}
