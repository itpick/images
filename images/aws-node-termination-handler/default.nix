{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.aws-node-termination-handler;
  name = "aws-node-termination-handler";
  tag = "v${pkgs.aws-node-termination-handler.version}";
  
  entrypoint = [ "aws-node-termination-handler" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "aws-node-termination-handler";
    "org.opencontainers.image.description" = "aws-node-termination-handler container image";
    "org.opencontainers.image.version" = pkgs.aws-node-termination-handler.version;
  };
  
  user = nonRoot.userString;
}
