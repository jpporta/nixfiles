{ config, pkgs, ... }: {

  programs.zsh = {
    enable = true;
    initExtra = ''
      		[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      		neofetch
      		'';
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    shellAliases = {
      tx = "tmuxinator";
      gup = "git add --all && git commit -m \"$(date)\" && git push";
      n = "nvim";
    };
  };
}
