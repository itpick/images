{ mkImage, pkgs, nonRoot, ... }:

# FIPS variant - uses same base package

mkImage {
  drv = pkgs.kubernetes;
  name = "kubelet-fips";
  tag = "latest";
  
  entrypoint = [ "kubernetes" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "kubelet-fips";
    "org.opencontainers.image.description" = "kubelet-fips container image";
    "org.opencontainers.image.version" = pkgs.kubernetes.version;
  };
  
  user = nonRoot.userString;
}
