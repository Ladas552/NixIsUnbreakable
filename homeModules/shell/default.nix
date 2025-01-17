{
  pkgs,
  lib,
  config,
  meta,
  ...
}:

{
  options.customhm = {
    shell.enable = lib.mkEnableOption "enable shell";
  };

  config = lib.mkIf config.customhm.shell.enable {
    # Shell programs
    programs = {
      ripgrep.enable = true;
      fd.enable = true;
      btop.enable = true;
      bat.enable = true;
      fzf = {
        enable = true;
        enableFishIntegration = true;
      };
      zoxide = {
        enable = true;
        enableFishIntegration = true;
      };
      eza = {
        enable = true;
        enableFishIntegration = true;
        extraOptions = [ "--icons" ];
      };
      # Makes some rebuilds longer and breaks some complretions
      # carapace = {
      #   enable = true;
      # };
    };

    # Shells
    programs.fish = {
      enable = true;
      plugins = with pkgs.fishPlugins; [
        {
          name = "autopair";
          src = autopair.src;
        }
        {
          name = "bass";
          src = bass.src;
        }
        {
          name = "pure";
          src = pure.src;
        }
        {
          name = "done";
          src = done.src;
        }
        {
          name = "puffer";
          src = puffer.src;
        }
        {
          name = "sponge";
          src = sponge.src;
        }
      ];
      shellAbbrs = {
        clean = "nh clean all";
        yy = "nh os switch ${meta.self}";
        yyy = "nh os switch -u ${meta.self}";
        en = "nvim ${meta.self}";
        enn = "nvim ${meta.self}/hosts/${meta.host}/";
        eh = "hx ${meta.self}";
        v = "nvim";
        ls = "eza";
        dl-video = "yt-dlp --embed-thumbnail -f bestvideo[ext=mp4]+bestaudio[ext=m4a format_note~='(?i)original']/mp4 --output '%(title)s.%(ext)s'";
        dl-clips = "yt-dlp --embed-thumbnail -f bestvideo[ext=mp4]+bestaudio[ext=m4a format_note~='(?i)original']/mp4 --ignore-errors --output '${config.xdg.userDirs.videos}/clips/%(playlist)s/%(playlist_index)s-%(title)s.%(ext)s' --yes-playlist";
        dl-vocaloid = "yt-dlp --add-metadata --parse-metadata 'playlist_title:%(album)s' --embed-thumbnail --ignore-errors --format bestaudio --extract-audio --audio-format mp3 --output '${config.xdg.userDirs.music}/vocaloid/%(playlist_uploader)s/%(playlist)s/%(title)s.%(ext)s' --yes-playlist";
        mc = "ranger";
        mcv = "ranger ${config.xdg.userDirs.videos}";
        mcva = "ranger ${config.xdg.userDirs.videos}/Anime/";
        mcm = "ranger ${config.xdg.userDirs.music}";
        mcc = "ranger ~/.config/";
        mcp = "ranger ${config.xdg.userDirs.pictures}";
      };
      shellAliases = { };
    };
    programs.bash = {
      enable = true;
      enableCompletion = true;
    };
    home.shellAliases = {
      cat = "${lib.getExe pkgs.bat}";
      wiki = "${lib.getExe pkgs.wiki-tui}";
      df = "${lib.getExe pkgs.duf}";
      copypaste = "${lib.getExe pkgs.wgetpaste}";
      cmatrix = "${lib.getExe pkgs.unimatrix} -f -s 95";
      fastfetch = "fastfetch | ${lib.getExe pkgs.lolcat}";
      en = "nvim ${meta.self}";
      enn = "nvim ${meta.self}/hosts/NixToks/";
      eh = "hx ${meta.self}";
      v = "nvim";
      ls = "eza";
      cd = "z";
      mc = "ranger";
      clean = "nh clean all";
      yy = "nh os switch ${meta.self}";
      yyy = "nh os switch -u ${meta.self}";
      serve = "~/.cargo/bin/norgolith serve";
      ungl = "source ~/Desktop/ungl.sh";
    };
  };
}
