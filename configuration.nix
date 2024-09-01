{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = ""; # TODO: fill in
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "en_US.UTF-8";

  nix.binaryCaches = [
    "https://mirrors.ustc.edu.cn/nix-channels/store"
  ];
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.substituters = lib.mkForce [
    "https://mirrors.ustc.edu.cn/nix-channels/store"
  ];
  nix.settings.trusted-users = [ "evlos" ];

  users.users.evlos = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKQ8q1i5or0ARt3wqkEr3g7JW7jvQZ0IsXQOauSgMXAJ evlos@flamebook"
    ];
  };

  environment.systemPackages = with pkgs; [
    curl
  ];

  system.stateVersion = "23.05";

}
