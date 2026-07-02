{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.kubectl;
  name = "kubectl-1.33-default";
  tag = "v${pkgs.kubectl.version}";
  
  entrypoint = [ "kubectl" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "kubectl-1.33-default";
    "org.opencontainers.image.description" = "kubectl-1.33-default container image";
    "org.opencontainers.image.version" = pkgs.kubectl.version;
  };
  
  user = nonRoot.userString;
}
