{ ... }:

{
  nix.settings.trusted-users = [ "robinb" ];

  users.users.robinb = {
    description = "Robin Bourachot";
    extraGroups = [ "docker" "networkmanager" "wheel" ];
    hashedPassword = "$6$3Fds7NhuGr1/Yilb$BvvIPYw3qHsBMnNKaZG1EbQOV/YGW3/f4fEbqr1AE24k8TWnFTiJSxcTOQzWQ3LNfMcxC3EGVBiMabvvspPMz.";
    isNormalUser = true;

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOsUVH8EZHld/2r6/lx89DkAMM3fTWGLnkdkpBRvsX6k robinb@hana"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJAZ3hoQZX9Y5w0jLNCcKBlpKyeaaVn7zOsDoI+0ee7b robinb@yeoreum"
    ];
  };
}
