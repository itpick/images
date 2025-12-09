{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for litestream:
# Packages available in nixpkgs:
#   pkgs.litestream  # litestream (0.5.2-r2)
#   pkgs.tzdata  # tzdata (2025b-r2)

mkImage {
  drv = pkgs.litestream;
  name = "litestream";
  tag = "v${pkgs.litestream.version}";
  entrypoint = [ "${pkgs.litestream}/bin/litestream" ];
  cmd = [ "replicate" ];

  extraPkgs = with pkgs; [ tzdata ];

  labels = {
    "org.opencontainers.image.title" = "Litestream";
    "org.opencontainers.image.description" = "Streaming replication for SQLite databases";
    "org.opencontainers.image.version" = pkgs.litestream.version;
    "io.nix-containers.chart" = "litestream";
  };
}
