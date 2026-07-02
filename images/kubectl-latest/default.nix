{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.kubectl;
  name = "kubectl-latest";
  tag = "v${pkgs.kubectl.version}";
  
  entrypoint = [ "kubectl" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "kubectl-latest";
    "org.opencontainers.image.description" = "kubectl-latest container image";
    "org.opencontainers.image.version" = pkgs.kubectl.version;
  };
  
  user = nonRoot.userString;
}
