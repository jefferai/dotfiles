{ config, pkgs, ... }:

let
  unstable = import <unstable> {};
  # local = import /home/jeff/src/nixpkgs {};
in {
  # Let Home Manager install and manage itself.
  programs.home-manager = {
    enable = true;
    path = "...";
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";

  home.packages = [
    unstable.protobuf
    unstable.terraform
    pkgs.python3
    pkgs.httpie
    pkgs.yq
    pkgs.kubectl
    pkgs.awscli2
    pkgs.ffmpeg
    unstable.bats
    unstable.yarn
    unstable.nodejs
    pkgs.swagger-codegen
    pkgs.bazel
    unstable.azure-cli
  ];

  home.username = "jeff";

  home.homeDirectory = "/home/jeff";
}
