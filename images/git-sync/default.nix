{ mkImage, pkgs, lib, ... }:

# git-sync - Sidecar to synchronize a git repository
# https://github.com/kubernetes/git-sync

mkImage {
  drv = pkgs.git-sync;
  name = "git-sync";
  tag = "v${pkgs.git-sync.version}";
  entrypoint = [ "${pkgs.git-sync}/bin/git-sync" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert git openssh ];

  labels = {
    "org.opencontainers.image.title" = "git-sync";
    "org.opencontainers.image.description" = "Sidecar to continuously synchronize a git repository";
    "org.opencontainers.image.version" = pkgs.git-sync.version;
  };
}
