{ mkImage, pkgs, nonRoot, ... }:

# FIPS variant - uses same base package

mkImage {
  drv = pkgs.kuberay-operator;
  name = "kuberay-operator-fips";
  tag = "latest";
  
  entrypoint = [ "kuberay-operator" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "kuberay-operator-fips";
    "org.opencontainers.image.description" = "kuberay-operator-fips";
    "org.opencontainers.image.version" = pkgs.kuberay-operator.version;
  };
  
  user = nonRoot.userString;
}
