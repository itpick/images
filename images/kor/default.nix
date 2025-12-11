{ mkImage, pkgs, lib, ... }:

# kor - Kubernetes Orphaned Resources Finder
# https://github.com/yonahd/kor

mkImage {
  drv = pkgs.kor;
  name = "kor";
  tag = "v${pkgs.kor.version}";
  entrypoint = [ "${pkgs.kor}/bin/kor" ];
  cmd = [ "version" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "kor";
    "org.opencontainers.image.description" = "Tool to discover unused Kubernetes resources";
    "org.opencontainers.image.version" = pkgs.kor.version;
  };
}
