{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for tektoncd-cli:
# Packages available in nixpkgs:
#   pkgs.tektoncd-cli  # Provides a CLI for interacting with Tekton - tkn

mkImage {
  drv = pkgs.tektoncd-cli;
  name = "tektoncd-cli";
  tag = "v${pkgs.tektoncd-cli.version}";
  entrypoint = [ "${pkgs.tektoncd-cli}/bin/tkn" ];
  cmd = [ "help" ];

  labels = {
    "org.opencontainers.image.title" = "Tekton CLI";
    "org.opencontainers.image.description" = "CLI for interacting with Tekton Pipelines";
    "org.opencontainers.image.version" = pkgs.tektoncd-cli.version;
    "io.nix-containers.chart" = "tekton-pipelines";
  };
}
