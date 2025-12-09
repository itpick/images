{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for minio-client:
# Packages available in nixpkgs:
#   pkgs.bash  # bash (5.3-r3)
#   pkgs.coreutils  # coreutils (9.9-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libselinux  # libselinux (3.9-r1)
#   pkgs.libsepol  # libsepol (3.9-r1)
#   pkgs.mc  # mc (0.20250813.083541-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)
#   libacl1 (2.3.2-r54)
#   libattr1 (2.5.2-r54)
#   libcrypto3 (3.6.0-r4)
#   libpcre2-8-0 (10.47-r0)
#   ncurses-terminfo-base (6.5_p20251025-r1)

mkImage {
  drv = pkgs.minio-client;
  name = "mc";
  tag = "latest";
  entrypoint = [ "${pkgs.minio-client}/bin/mc" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "MinIO Client";
    "org.opencontainers.image.description" = "MinIO Client for object storage operations";
    "org.opencontainers.image.version" = pkgs.minio-client.version;
    "io.nix-containers.chart" = "loki";
  };
}
