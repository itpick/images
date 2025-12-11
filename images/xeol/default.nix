{ mkImage, pkgs, lib, ... }:

# xeol - End-of-life software scanner
# https://github.com/xeol-io/xeol

mkImage {
  drv = pkgs.xeol;
  name = "xeol";
  tag = "v${pkgs.xeol.version}";
  entrypoint = [ "${pkgs.xeol}/bin/xeol" ];
  cmd = [ "version" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "xeol";
    "org.opencontainers.image.description" = "Scanner to find end-of-life (EOL) software in container images and SBOMs";
    "org.opencontainers.image.version" = pkgs.xeol.version;
  };
}
