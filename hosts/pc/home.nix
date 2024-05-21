{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "jpporta";
  home.homeDirectory = "/home/jpporta";
  home.stateVersion = "23.11"; # Please read the comment before changing.
  nixpkgs.config.allowUnfree = true;

  imports = [
    ../../homeManagerModules
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };
  home.file.".XCompose".text = ''
    include "%L"

    <dead_acute> <C> : "Ç"
    <dead_acute> <c> : "ç"
  '';

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.gpg.enable = true;
}
