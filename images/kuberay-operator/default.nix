{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.kuberay-operator;
  name = "kuberay-operator";
  tag = "latest";
  
  entrypoint = [ "kuberay-operator" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "kuberay-operator";
    "org.opencontainers.image.description" = "Last changed 3 days ago";
    "org.opencontainers.image.version" = pkgs.kuberay-operator.version;
  };
  
  user = nonRoot.userString;
}
