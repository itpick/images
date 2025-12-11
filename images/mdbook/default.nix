{ mkImage, pkgs, lib, ... }:

# mdBook - Utility to create online books from Markdown
# https://rust-lang.github.io/mdBook/

mkImage {
  drv = pkgs.mdbook;
  name = "mdbook";
  tag = "v${pkgs.mdbook.version}";
  entrypoint = [ "${pkgs.mdbook}/bin/mdbook" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "mdBook";
    "org.opencontainers.image.description" = "Create books from Markdown files";
    "org.opencontainers.image.version" = pkgs.mdbook.version;
  };
}
