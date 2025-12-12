{ mkImage, pkgs, lib, ... }:

# jo - JSON output from shell
# https://github.com/jpmens/jo

mkImage {
  drv = pkgs.jo;
  name = "jo";
  tag = "v${pkgs.jo.version}";
  entrypoint = [ "${pkgs.jo}/bin/jo" ];
  cmd = [ "-h" ];

  labels = {
    "org.opencontainers.image.title" = "jo";
    "org.opencontainers.image.description" = "JSON output from a shell";
    "org.opencontainers.image.version" = pkgs.jo.version;
  };
}
