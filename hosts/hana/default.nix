{
  config,
  pkgs,
  username,
  aagl,
... }:

{
  imports = [
    aagl.nixosModules.default
    ../shared
    ./system/boot.nix
    ./system/hardware.nix
  ];

  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  environment.systemPackages = with pkgs; [
    os-prober
    prismlauncher
    steamPackages.steamcmd
  ];

  networking.hostName = "hana"; # Define your hostname.

  nix.settings = aagl.nixConfig;

  # NVIDIA GPU-related configuration
  programs.hyprland.enableNvidiaPatches = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.modesetting.enable = true;

  programs.anime-game-launcher.enable = true;

  services.xserver.displayManager = {
    autoLogin.enable = true;
    autoLogin.user = username;
  };

  swapDevices = [{ device = "/dev/sda3"; }];

  system.stateVersion = "22.11";
}
