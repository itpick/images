# crossplane-provider-aws
# =============
# Crossplane AWS Provider - Manage AWS resources via Crossplane
# https://github.com/crossplane-contrib/provider-aws

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Chainguard SBOM packages for crossplane-provider-aws:
# Packages available in nixpkgs:
#   pkgs.crossplane  # crossplane-2.1 (2.1.3-r1)

let
  version = "0.54.0";
  provider-aws = buildGoModule {
    pname = "provider-aws";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane-contrib";
      repo = "provider-aws";
      rev = "v${version}";
      hash = "sha256-ng6LoxNnow8RkhIBa+CdKEToCQdA4eEY0JhzuxPSqlU=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-dNA0DOQjL9tp/RSgo2wmFghxjDMybeMLtglJTLYyM8A=";  # TODO: Fix hash after first build

    subPackages = [ "cmd/provider" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/crossplane-contrib/provider-aws/internal/version.Version=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Crossplane AWS Provider for managing AWS resources";
      homepage = "https://github.com/crossplane-contrib/provider-aws";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = provider-aws;
  name = "crossplane-provider-aws";
  tag = "v${version}";
  entrypoint = [ "${provider-aws}/bin/provider" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane Provider AWS";
    "org.opencontainers.image.description" = "Crossplane AWS Provider for managing AWS resources";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
  };
}
