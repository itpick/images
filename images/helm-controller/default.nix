{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:


# Chainguard SBOM packages for helm-controller:
# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
# Packages NOT in nixpkgs:
#   cluster-api-helm-controller (0.5.2-r1)
#   ld-linux (2.42-r4)

let
  version = "1.6.1";
  helm-controller = buildGoModule {
    pname = "helm-controller";
    inherit version;

    src = fetchFromGitHub {
      owner = "fluxcd";
      repo = "helm-controller";
      rev = "v${version}";
      hash = "sha256-2FQ7bmi2W2Mx+8ymf0lnHZl3w/BVM+qPrzWQG9/N/Ks=";
    };

    vendorHash = "sha256-iknDf9K7UUlaC85+CeRqCuDBA0Nx5gAIejhxtHlEpQc=";

    subPackages = [ "." ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.VERSION=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Flux helm-controller for managing Helm releases";
      homepage = "https://github.com/fluxcd/helm-controller";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = helm-controller;
  name = "helm-controller";
  tag = "v${version}";
  entrypoint = [ "${helm-controller}/bin/helm-controller" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Flux Helm Controller";
    "org.opencontainers.image.description" = "Manages Helm releases declaratively";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "flux2";
  };
}
