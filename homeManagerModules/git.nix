{ config, ... }: {
  programs.git = {
    enable = true;
    userName = "Joao Pedro Pin Porta";
    userEmail = "jpedro.porta@gmail.com";
    extraConfig = {
      commit.gpgsign = true;
      user.signingKey = "B7DFC1392B5BE2B9";
      push = {
        autoSetupRemote = true;
      };
    };
  };
}
