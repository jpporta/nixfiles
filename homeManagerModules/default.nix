{ config, pkgs, ... }:
{
  imports = [
    ./git.nix
    ./kitty.nix
    # ./mpd.nix
    ./packages.nix
    # ./picom.nix
    # ./theming.nix
    ./zsh.nix
  ];
}
