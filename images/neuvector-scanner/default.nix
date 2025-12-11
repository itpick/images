# neuvector-scanner
# =============
# NeuVector Scanner - Vulnerability scanner for containers
# https://github.com/neuvector/scanner
#
# NeuVector Scanner performs vulnerability scanning of container images.

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

let
  version = "5.4.7";
  neuvector-scanner = buildGoModule {
    pname = "neuvector-scanner";
    inherit version;

    src = fetchFromGitHub {
      owner = "neuvector";
      repo = "scanner";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    subPackages = [ "." ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.Version=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "NeuVector Scanner - Container vulnerability scanner";
      homepage = "https://github.com/neuvector/scanner";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = neuvector-scanner;
  name = "neuvector-scanner";
  tag = "v${version}";
  entrypoint = [ "${neuvector-scanner}/bin/scanner" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "NeuVector Scanner";
    "org.opencontainers.image.description" = "Container vulnerability scanner";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "neuvector";
  };
}
