{ mkImage, pkgs, nonRoot, ... }:


mkImage {
  drv = pkgs.bank-vaults;
  name = "bank-vaults";
  tag = "latest";
  
  entrypoint = [ "bank-vaults" ];
  cmd = [ "--help" ];
  
  labels = {
    "org.opencontainers.image.title" = "bank-vaults";
    "org.opencontainers.image.description" = "Last changed 2 days ago";
    "org.opencontainers.image.version" = pkgs.bank-vaults.version;
  };
  
  user = nonRoot.userString;
}
