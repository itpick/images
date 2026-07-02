{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.karpenter;
  name = "karpenter";
  tag = "v${pkgs.karpenter.version}";
  
  entrypoint = [ "karpenter" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "karpenter";
    "org.opencontainers.image.description" = "karpenter container image";
    "org.opencontainers.image.version" = pkgs.karpenter.version;
  };
  
  user = nonRoot.userString;
}
