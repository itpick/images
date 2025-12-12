{ mkImage, pkgs, lib, ... }:

# envsubst - Environment variable substitution
# https://github.com/a8m/envsubst

mkImage {
  drv = pkgs.envsubst;
  name = "envsubst";
  tag = "v${pkgs.envsubst.version}";
  entrypoint = [ "${pkgs.envsubst}/bin/envsubst" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "envsubst";
    "org.opencontainers.image.description" = "Environment variable substitution for Go";
    "org.opencontainers.image.version" = pkgs.envsubst.version;
  };
}
