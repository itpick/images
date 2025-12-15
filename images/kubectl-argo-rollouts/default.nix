{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.kubectl-argo-rollouts;
  name = "kubectl-argo-rollouts";
  tag = "latest";
  
  entrypoint = [ "kubectl-argo-rollouts" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "kubectl-argo-rollouts";
    "org.opencontainers.image.description" = "kubectl-argo-rollouts";
    "org.opencontainers.image.version" = pkgs.kubectl-argo-rollouts.version;
  };
  
  user = nonRoot.userString;
}
