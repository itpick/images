{ mkImage, pkgs, lib, ... }:

# melange - Build APK packages from source
# https://github.com/chainguard-dev/melange

mkImage {
  drv = pkgs.melange;
  name = "melange";
  tag = "v${pkgs.melange.version}";
  entrypoint = [ "${pkgs.melange}/bin/melange" ];
  cmd = [ "version" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "melange";
    "org.opencontainers.image.description" = "Build APK packages from source using declarative pipelines";
    "org.opencontainers.image.version" = pkgs.melange.version;
  };
}
