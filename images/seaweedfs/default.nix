{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for seaweedfs:
# Packages available in nixpkgs:
#   pkgs.dash  # dash (0.5.13-r2)
#   pkgs.fuse2  # fuse2 (2.9.9-r53)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.seaweedfs  # seaweedfs (4.01-r0)
#   pkgs.su-exec  # su-exec (0.3-r0)
# Packages NOT in nixpkgs:
#   dash-binsh (0.5.13-r2)
#   ld-linux (2.42-r4)
#   seaweedfs-oci-entrypoint (4.01-r0)

# SeaweedFS - Simple and highly scalable distributed file system
mkImage {
  drv = pkgs.seaweedfs;
  name = "seaweedfs";
  tag = pkgs.seaweedfs.version;
  entrypoint = [ "${pkgs.seaweedfs}/bin/weed" ];
  cmd = [ "--help" ];
  # Chainguard runs seaweedfs as root
  user = "0:0";

  labels = {
    "org.opencontainers.image.title" = "SeaweedFS";
    "org.opencontainers.image.description" = "Simple and highly scalable distributed file system";
    "org.opencontainers.image.version" = pkgs.seaweedfs.version;
    "io.nix-containers.chart" = "seaweedfs";
  };
}
