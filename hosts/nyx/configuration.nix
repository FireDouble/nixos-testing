{
  pkgs,
  inputs,
  ...
}:
{
  nix = {
    package = pkgs.lix;
    settings = {
      extra-experimental-features = [
        "flakes"
        "nix-command"
      ];
    };
  };

  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/games/default.nix
    ../../modules/nixos/themes/catppuccin.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  boot = {
    tmp.cleanOnBoot = true;
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
      efi.canTouchEfiVariables = true;
    };
  };

  networking.hostName = "nyx";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Warsaw";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };

    printing.enable = true;
  };

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  users.users.shizu = {
    isNormalUser = true;
    description = "Shizu";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
    packages =
      with pkgs;
      [
      ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs;
    };
    backupFileExtension = "bak";
    users = {
      shizu = import ./home.nix;
    };
  };

  programs.fish.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    home-manager

    catppuccin-cursors.mochaLavender
    nwg-look
    vesktop
    pavucontrol

    git
    curl
    tree
    unzip
    cmatrix
    fastfetch
    nixfmt-rfc-style

    vscode
  ];

  system.stateVersion = "24.05";
}
