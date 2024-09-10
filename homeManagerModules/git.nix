{ config, ... }:
{
  programs.git = {
    enable = true;
    userName = "Joao Pedro Pin Porta";
    userEmail = "jpedro.porta@gmail.com";
    extraConfig = {
      commit.gpgsign = false;
      push = {
        autoSetupRemote = true;
      };
    };
  };
}
