{ mkImage, pkgs, lib, ... }:

# RStudio - IDE for R language
# https://www.rstudio.com/

mkImage {
  drv = pkgs.rstudio;
  name = "rstudio";
  tag = "v${pkgs.rstudio.version}";
  entrypoint = [ "${pkgs.rstudio}/bin/rstudio" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "RStudio";
    "org.opencontainers.image.description" = "IDE for R language";
    "org.opencontainers.image.version" = pkgs.rstudio.version;
  };
}
