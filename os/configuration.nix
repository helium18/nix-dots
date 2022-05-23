{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./boot.nix
      ./net.nix
      ./hp-omen.nix
      ./helium.nix
      ./packages.nix

      # services
      ./services/xserver.nix
      ./services/tlp.nix
      ./services/picom.nix
      ./services/redshift.nix
    ];

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Asia/Kolkata";

  system.stateVersion = "21.11";
}

