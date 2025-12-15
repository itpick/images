{ mkImage, pkgs, nonRoot, ... }:

# Gotenberg - A Docker-powered stateless API for PDF generation
# Converts HTML, Markdown, Word, Excel and more to PDF

mkImage {
  drv = pkgs.gotenberg;
  name = "gotenberg";
  tag = "v${pkgs.gotenberg.version}";

  entrypoint = [ "${pkgs.gotenberg}/bin/gotenberg" ];
  cmd = [];

  env = {
    GOTENBERG_API_PORT = "3000";
    GOTENBERG_LOG_LEVEL = "info";
  };

  labels = {
    "org.opencontainers.image.title" = "Gotenberg";
    "org.opencontainers.image.description" = "A Docker-powered stateless API for PDF generation";
    "org.opencontainers.image.version" = pkgs.gotenberg.version;
  };

  user = nonRoot.userString;
}
