{ mkImage, pkgs, lib, ... }:

# buck2 - Fast, hermetic, multi-language build system
# https://buck2.build/

mkImage {
  drv = pkgs.buck2;
  name = "buck2";
  tag = "v${pkgs.buck2.version}";
  entrypoint = [ "${pkgs.buck2}/bin/buck2" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "buck2";
    "org.opencontainers.image.description" = "Fast, hermetic, multi-language build system from Meta";
    "org.opencontainers.image.version" = pkgs.buck2.version;
  };
}
