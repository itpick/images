{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.nginx-ingress-controller;
  name = "ingress-nginx-controller";
  tag = "latest";
  
  entrypoint = [ "nginx-ingress-controller" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "ingress-nginx-controller";
    "org.opencontainers.image.description" = "ingress-nginx-controller";
    "org.opencontainers.image.version" = pkgs.nginx-ingress-controller.version;
  };
  
  user = nonRoot.userString;
}
