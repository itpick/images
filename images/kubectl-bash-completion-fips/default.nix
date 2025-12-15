{ mkImage, pkgs, nonRoot, ... }:

# FIPS variant - uses same base package

mkImage {
  drv = pkgs.kubectl;
  name = "kubectl-bash-completion-fips";
  tag = "latest";
  
  entrypoint = [ "kubectl" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "kubectl-bash-completion-fips";
    "org.opencontainers.image.description" = "kubectl-bash-completion-fips container image";
    "org.opencontainers.image.version" = pkgs.kubectl.version;
  };
  
  user = nonRoot.userString;
}
