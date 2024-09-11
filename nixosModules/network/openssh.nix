{ config, lib, pkgs, ...}:

{
  options.custom = {
    openssh.enable = lib.mkEnableOption "enable openssh";
  };

  config = lib.mkIf config.custom.openssh.enable {

    # SSH connections
    services.openssh = {
      enable = true;
      ports = [ 22 ];
      openFirewall = true;
      banner = "You shell not pass!";
      startWhenNeeded = true;
      settings = {
        PasswordAuthentication = false;
        AllowUsers = null;
        UseDns = true;
        X11Forwarding = false;
        PermitRootLogin = lib.mkDefault "no"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
      };
    };
  };
}
