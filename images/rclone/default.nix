{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for rclone:
# Packages available in nixpkgs:
#   pkgs.fuse3  # fuse3 (3.17.4-r0)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.rclone  # rclone (1.72.0-r1)
#   pkgs.tzdata  # tzdata (2025b-r2)
# Packages NOT in nixpkgs:
#   ca-certificates (20251003-r0)
#   fuse3-libs (3.17.4-r0)
#   ld-linux (2.42-r4)

mkImage {
  drv = pkgs.rclone;
  name = "rclone";
  tag = "v${pkgs.rclone.version}";
  entrypoint = [ "${pkgs.rclone}/bin/rclone" ];
  cmd = [ "help" ];
  user = "0:0";  # rclone often needs root for mount operations

  extraPkgs = with pkgs; [ fuse3 tzdata cacert ];

  labels = {
    "org.opencontainers.image.title" = "rclone";
    "org.opencontainers.image.description" = "Command line program to sync files and directories to and from cloud storage";
    "org.opencontainers.image.version" = pkgs.rclone.version;
    "io.nix-containers.chart" = "rclone";
  };
}
