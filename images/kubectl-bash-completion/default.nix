{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.kubectl;
  name = "kubectl-bash-completion";
  tag = "v${pkgs.kubectl.version}";
  
  entrypoint = [ "kubectl" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "kubectl-bash-completion";
    "org.opencontainers.image.description" = "kubectl-bash-completion container image";
    "org.opencontainers.image.version" = pkgs.kubectl.version;
  };
  
  user = nonRoot.userString;
}
