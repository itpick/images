{ mkImage, pkgs, lib, ... }:

# dust (du-dust) - Disk usage analyzer
# https://github.com/bootandy/dust

mkImage {
  drv = pkgs.dust;
  name = "dust";
  tag = "v${pkgs.dust.version}";
  entrypoint = [ "${pkgs.dust}/bin/dust" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "dust";
    "org.opencontainers.image.description" = "More intuitive version of du in Rust";
    "org.opencontainers.image.version" = pkgs.dust.version;
  };
}
