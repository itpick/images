{ mkImage, pkgs, lib, ... }:

mkImage {
  drv = pkgs.hadolint;
  name = "hadolint";
  tag = "v${pkgs.hadolint.version}";
  entrypoint = [ "${pkgs.hadolint}/bin/hadolint" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Hadolint";
    "org.opencontainers.image.description" = "Dockerfile Linter that validates best practices";
    "org.opencontainers.image.version" = pkgs.hadolint.version;
    "io.nix-containers.chart" = "hadolint";
  };
}
