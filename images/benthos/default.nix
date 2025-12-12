{ mkImage, pkgs, lib, ... }:

# Benthos - Stream processing made operationally mundane
# https://www.benthos.dev/

mkImage {
  drv = pkgs.benthos;
  name = "benthos";
  tag = "v${pkgs.benthos.version}";
  entrypoint = [ "${pkgs.benthos}/bin/benthos" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Benthos";
    "org.opencontainers.image.description" = "Fancy stream processing made operationally mundane";
    "org.opencontainers.image.version" = pkgs.benthos.version;
  };
}
