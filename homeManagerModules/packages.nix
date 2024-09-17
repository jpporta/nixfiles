{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neovim
    firefox
    stow
    nodejs
    deno
    slack
    obsidian
    openssl
    cargo
    yarn
    nodePackages.pnpm
    nodePackages.eslint_d
    nodePackages.prettier
    nodePackages.typescript-language-server
    fzf
    ripgrep
    go
    tree-sitter
    gcc
    fd
    tmux
    tmuxinator
    feh
    scrot
    xclip
    glib
    zoom-us
    gphoto2
    ffmpeg
    thunderbird
    krita
    picom
    rnote
    polybar
    spotify
    lazygit
    jq
    libmpdclient
    cargo
    python3
    silicon
    bat
    freetype
    stylua
    openvpn
    discord
    gparted
    woeusb
    awscli
    dunst
    redis
    sampler
    google-chrome
    golangci-lint
    gotools
    zip
    pinentry
    beekeeper-studio
    onlyoffice-bin
    telegram-desktop
    kubectl
    pavucontrol
    tidal-hifi
    playerctl
    turbo
    arandr
    bc
    p3x-onenote
    codespell
    nixfmt-rfc-style
    fastfetch
    typescript
    vscode-langservers-extracted
    emmet-ls
    tailwindcss-language-server
    vlc
    bun
    flyctl
		redis
		obs-studio
		zoxide
		eza
		yazi
  ];
}
