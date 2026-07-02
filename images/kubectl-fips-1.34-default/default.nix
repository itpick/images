{ mkImage, pkgs, nonRoot, ... }:

# FIPS variant - uses same base package

mkImage {
  drv = pkgs.kubectl;
  name = "kubectl-fips-1.34-default";
  tag = "v${pkgs.kubectl.version}";
  
  entrypoint = [ "kubectl" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "kubectl-fips-1.34-default";
    "org.opencontainers.image.description" = "kubectl-fips-1.34-default container image";
    "org.opencontainers.image.version" = pkgs.kubectl.version;
  };
  
  user = nonRoot.userString;
}
