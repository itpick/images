{ mkImage, pkgs, lib, ... }:

# timoni - Kubernetes package manager powered by CUE
# https://timoni.sh/

mkImage {
  drv = pkgs.timoni;
  name = "timoni";
  tag = "v${pkgs.timoni.version}";
  entrypoint = [ "${pkgs.timoni}/bin/timoni" ];
  cmd = [ "version" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "timoni";
    "org.opencontainers.image.description" = "Kubernetes package manager powered by CUE";
    "org.opencontainers.image.version" = pkgs.timoni.version;
  };
}
