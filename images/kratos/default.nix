{ mkImage, pkgs, lib, ... }:

# Ory Kratos - Identity and user management
# https://www.ory.sh/kratos/

mkImage {
  drv = pkgs.kratos;
  name = "kratos";
  tag = "v${pkgs.kratos.version}";
  entrypoint = [ "${pkgs.kratos}/bin/kratos" ];
  cmd = [ "version" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Ory Kratos";
    "org.opencontainers.image.description" = "Identity and user management system";
    "org.opencontainers.image.version" = pkgs.kratos.version;
  };
}
