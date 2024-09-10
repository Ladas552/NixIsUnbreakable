{ config, lib, pkgs, ...}:

{
  options.custom = {
    bluetooth.enable = lib.mkEnableOption "enable bluetooth";
  };

  config = lib.mkIf config.custom.bluetooth.enable {

    # Bluetooth
    hardware.bluetooth.enable = true; # enables support for Bluetooth
    hardware.bluetooth.powerOnBoot = false; # powers up the default Bluetooth controller on boot
    services.blueman.enable = true;
  };
}