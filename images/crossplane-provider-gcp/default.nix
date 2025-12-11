# crossplane-provider-gcp
# =============
# Crossplane GCP Provider - Manage GCP resources via Crossplane
# https://github.com/crossplane-contrib/provider-gcp

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Chainguard SBOM packages for crossplane-provider-gcp:
# Packages available in nixpkgs:
#   pkgs.crossplane  # crossplane-2.1 (2.1.3-r1)

let
  version = "0.22.0";
  provider-gcp = buildGoModule {
    pname = "provider-gcp";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-gcp";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    subPackages = [ "cmd/provider" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/crossplane-contrib/provider-gcp/internal/version.Version=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Crossplane GCP Provider for managing GCP resources";
      homepage = "https://github.com/crossplane-contrib/provider-gcp";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-gcp;
  name = "crossplane-provider-gcp";
  tag = "v${version}";
  entrypoint = [ "${provider-gcp}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider GCP";
    "org.opencontainers.image.description" = "Crossplane GCP Provider for managing GCP resources";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
