{ mkImage, pkgs, nonRoot, ... }:

# FIPS variant - uses same base package

mkImage {
  drv = pkgs.kubectl;
  name = "kubectl-fips";
  tag = "v${pkgs.kubectl.version}";
  
  entrypoint = [ "kubectl" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "kubectl-fips";
    "org.opencontainers.image.description" = "Last changed 1 day ago";
    "org.opencontainers.image.version" = pkgs.kubectl.version;
  };
  
  user = nonRoot.userString;
}
