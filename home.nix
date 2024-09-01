{ config, pkgs, ... }:

{
  home.username = "evlos";
  home.homeDirectory = "/home/evlos";

  home.packages = with pkgs;[
  ];

  home.stateVersion = "23.05";

  programs.home-manager.enable = true;

}
