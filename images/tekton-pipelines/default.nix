{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# tekton-pipelines (tkn CLI)
# ==========================
# Tekton CLI (tkn) — command-line tool for working with Tekton resources
# https://github.com/tektoncd/cli
#
# NOTE: This image wraps the tkn CLI from nixpkgs (pkgs.tektoncd-cli).
# It does NOT include the Tekton Pipelines controller or webhook images.
# The controller ships at gcr.io/tekton-releases/... which requires
# authenticated GAR pulls; that image is a known gap — see README.md.

let
  appPackages = with pkgs; [
    tektoncd-cli
    bash
    coreutils
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];
in
nix2container.buildImage {
  name = "tekton-pipelines";
  tag = "v${pkgs.tektoncd-cli.version}";

  copyToRoot = [
    (buildEnv {
      name = "tekton-pipelines-root";
      paths = base.basePackages ++ appPackages ++ [ userEnv ];
    })
  ];

  config = {
    Entrypoint = [ "${pkgs.tektoncd-cli}/bin/tkn" ];
    User = "1000:1000";
    Labels = {
      "org.opencontainers.image.title"       = "Tekton CLI (tkn)";
      "org.opencontainers.image.description" = "Tekton CLI (tkn) — command-line tool for working with Tekton resources";
      "org.opencontainers.image.version"     = pkgs.tektoncd-cli.version;
      "org.opencontainers.image.source"      = "https://github.com/tektoncd/cli";
      "io.nix-containers.build-strategy"     = "nixpkgs-wrapped";
      "io.nix-containers.image.category"     = "ci-cd";
      "io.nix-containers.followup"           = "tekton-controller-image-requires-authenticated-GAR";
    };
  };
}
