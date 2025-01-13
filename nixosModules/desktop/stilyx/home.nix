{ lib, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
  stylix.targets = {
    bspwm.enable = false;
    kitty.enable = false;
    # xfce.enable = config.custom.xfce.enable;
    vesktop.enable = true;
    fish.enable = false;
    nixvim.enable = false;
    helix.enable = false;
    emacs.enable = false;
  };
  #all of the below is from @xsharawi
  stylix.cursor.name = "BreezeX-RosePine-Linux";
  # forceing because stylix is dumb
  home.pointerCursor = {
    x11.enable = true;
    gtk.enable = true;
    package = lib.mkForce pkgs.rose-pine-cursor;
    size = lib.mkForce 40;
    name = lib.mkForce "BreezeX-RosePine-Linux";
  };
}
