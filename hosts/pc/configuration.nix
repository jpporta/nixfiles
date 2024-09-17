{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [ ./hardware-configuration.nix ];

  main-user.enable = true;
  main-user.userName = "jpporta";
  main-user.name = "Joao Pedro Pin Porta";

  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
    };
    users = {
      "jpporta" = ./home.nix;
    };
  };

  # Bootloader.
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelModules = [ "v4l2loopback" ]; # Autostart kernel modules on boot
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ]; # loopback module to make OBS virtual
  };

  networking = {
		hostName = "NixOS-jpporta";
		dhcpcd.enable = false;
		interfaces = {
				eno1.ipv4.addresses = [{
						address = "192.168.3.150";
						prefixLength = 24;
				}];
		};
		defaultGateway = "192.168.3.1";
		firewall = {
				enable = true;
				allowedTCPPortRanges = [
						{ from = 3000; to = 3100; }
				];
		};
	};

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.networkmanager.enable = true;

  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services = {
    getty = {
      autologinUser = "jpporta";
    };
    openssh = {
      enable = true;
      passwordAuthentication = false;
			authorizedKeysInHomedir = true;
    };
  };
  # services = {
  #   displayManager = {
  #     defaultSession = "none+i3"; };
  #   xserver = {
  #     xkb = {
  #       layout = "us,us";
  #       variant = ",intl";
  #       options = "grp:win_space_toggle";
  #     };
  #
  #     enable = true;
  #     desktopManager = {
  #       xterm.enable = false;
  #     };
  #     windowManager.i3 = {
  #       enable = true;
  #       extraPackages = with pkgs; [
  #         dmenu
  #         i3status
  #         i3lock
  #       ];
  #     };
  #   };
  # };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wget
    curl
    kitty
    vim
    unzip
    git
    xorg.xev
    killall
    dconf
    blueman
  ];
  environment.variables = {
    LD_LIBRARY_PATH = with pkgs; lib.makeLibraryPath [ fontconfig ];
  };
  environment.localBinInPath = true;
  hardware.bluetooth.enable = true;

  programs.dconf.enable = true;
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  system.stateVersion = "23.11"; # Did you read the comment?
}
