{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.tflint;
  name = "tflint";
  tag = "v${pkgs.tflint.version}";
  
  entrypoint = [ "tflint" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "tflint";
    "org.opencontainers.image.description" = "Last changed 3 days ago";
    "org.opencontainers.image.version" = pkgs.tflint.version;
  };
  
  user = nonRoot.userString;
}
