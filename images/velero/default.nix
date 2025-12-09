{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for velero:
# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.restic  # restic (0.18.1-r2)
#   pkgs.velero  # velero (1.17.1-r2)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)
#   velero-restore-helper (1.17.1-r2)

mkImage {
  drv = pkgs.velero;
  name = "velero";
  tag = "v${pkgs.velero.version}";
  entrypoint = [ "${pkgs.velero}/bin/velero" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ restic ];

  labels = {
    "org.opencontainers.image.title" = "Velero";
    "org.opencontainers.image.description" = "Backup and migrate Kubernetes applications and persistent volumes";
    "org.opencontainers.image.version" = pkgs.velero.version;
    "io.nix-containers.chart" = "velero";
  };
}
