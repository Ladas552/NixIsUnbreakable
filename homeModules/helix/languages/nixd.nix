{ pkgs, ... }:

{

  programs.helix = {
    extraPackages = [
      pkgs.nixd
      pkgs.nixfmt-rfc-style
    ];
    languages = {
      language-server.nixd = {
        command = "nixd";
        args = [ "--inlay-hints=true" ];
        config.nixd = {
          nixpkgs.expr = "import <nixpkgs> { }";
          options = {
            nixos.expr = "(builtins.getFlake ''/home/ladas552/Nix-dots'').nixosConfigurations.NixToks.options";
            home-manager.expr = "(builtins.getFlake ''/home/ladas552/Nix-dots'').nixosConfigurations.NixToks.options.home-manager.users.type.getSubOptions []";
            nix-on-droid.expr = "(builtins.getFlake ''/home/ladas552/Nix-dots'').nixOnDroidConfigurations.NixMux.config";
          };
        };
      };

      # shout out to Zeth for adopting nixd to helix
      language = [
        {
          name = "nix";
          scope = "source.nix";
          injection-regex = "nix";
          # Disables auto-save because of a bug
          # auto-format = true;
          file-types = [ "nix" ];
          comment-token = "#";
          indent = {
            tab-width = 2;
            unit = "  ";
          };
          language-servers = [ "nixd" ];
        }
      ];
    };
  };
}
