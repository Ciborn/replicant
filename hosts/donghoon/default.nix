{ config, pkgs, home-manager, nixpkgs, ... }:

{
  imports = [
    home-manager.nixosModules.home-manager
    (import "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64-installer.nix")
  ];

  cibnix.shells.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    btop
    # fastfetch
    htop
    lm_sensors
    nano
    pciutils
    tree
    vim
    wakeonlan
    wget
  ];

  networking.firewall.allowedTCPPorts = [ 22 ];
  
  networking.hostName = "donghoon";

  networking.wireless.enable = true;

  nixpkgs.hostPlatform.system = "aarch64-linux";
  nixpkgs.buildPlatform.system = "x86_64-linux";

  # sdImage.compressImage = false;

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };

  system.stateVersion = "23.11";

  users.users.robinb = {
    isNormalUser = true;
    description = "Robin Bourachot";
    extraGroups = [ "docker" "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJAZ3hoQZX9Y5w0jLNCcKBlpKyeaaVn7zOsDoI+0ee7b robinb@yeoreum"
    ];
  };

  virtualisation.vmVariant = {
    users.users.robinb.password = "password";
    virtualisation = {
      memorySize = 256;
      cores = 4;
      graphics = false;
    };
  };
}
