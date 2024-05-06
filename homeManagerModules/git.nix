{ config, ... }: {
  programs.git = {
    enable = true;
    userName = "Joao Pedro Pin Porta";
    userEmail = "jpedro.porta@gmail.com";
    extraConfig = {
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingKey = "~/.ssh/id_ed25519.pub";
      push = {
        autoSetupRemote = true;
      };
    };
  };
}
