{ mkImage, pkgs, nonRoot, ... }:

# FIPS variant - uses same base package

mkImage {
  drv = pkgs.kubectl-argo-rollouts;
  name = "kubectl-argo-rollouts-fips";
  tag = "latest";
  
  entrypoint = [ "kubectl-argo-rollouts" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "kubectl-argo-rollouts-fips";
    "org.opencontainers.image.description" = "kubectl-argo-rollouts-fips";
    "org.opencontainers.image.version" = pkgs.kubectl-argo-rollouts.version;
  };
  
  user = nonRoot.userString;
}
