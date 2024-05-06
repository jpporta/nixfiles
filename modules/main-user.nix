{lib, config, pkgs, ...}:

let
	cfg = config.main-user;
in
{
options.main-user = {
	enable = lib.mkEnableOption "enable user module";

	userName = lib.mkOption {
		default = "mainuser";
		description = ''
			username
		'';
	};
	name = lib.mkOption {
		default = "Main User";
		description = "User Name";
	};
};
	config = lib.mkIf cfg.enable {
		  users.users.${cfg.userName} = {
			    isNormalUser = true;
				initialPassword = "12345";
			    description = cfg.name;
			    extraGroups = [ "networkmanager" "wheel" ];
				shell = pkgs.zsh;
		  };
	};
}
