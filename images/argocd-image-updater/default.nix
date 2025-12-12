{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.argocd-image-updater;
  name = "argocd-image-updater";
  tag = "v${pkgs.argocd-image-updater.version}";
  entrypoint = [ "${pkgs.argocd-image-updater}/bin/argocd-image-updater" ];
  cmd = [ "run" ];

  extraPkgs = with pkgs; [ cacert git ];

  labels = {
    "org.opencontainers.image.title" = "Argo CD Image Updater";
    "org.opencontainers.image.description" = "Automatic container image update for Argo CD";
    "org.opencontainers.image.version" = pkgs.argocd-image-updater.version;
    "io.nix-containers.chart" = "argocd-image-updater";
  };
}
