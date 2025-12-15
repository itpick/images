{ mkImage, pkgs, nonRoot, ... }:

# FIPS variant - uses same base package

mkImage {
  drv = pkgs.kubectl;
  name = "kubectl-fips-latest";
  tag = "latest";
  
  entrypoint = [ "kubectl" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "kubectl-fips-latest";
    "org.opencontainers.image.description" = "kubectl-fips-latest container image";
    "org.opencontainers.image.version" = pkgs.kubectl.version;
  };
  
  user = nonRoot.userString;
}
