{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.zitadel;
  name = "zitadel";

  entrypoint = [ "zitadel" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "zitadel";
    "org.opencontainers.image.description" = "Identity and access management";
  };
  
  user = nonRoot.userString;
}
