# harbor-exporter
# =============
# Harbor Exporter - Prometheus metrics exporter for Harbor
# https://github.com/goharbor/harbor

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Harbor Exporter exposes Prometheus metrics for Harbor components

let
  version = "2.14.1";
  harbor-exporter = buildGoModule {
    pname = "harbor-exporter";
    inherit version;

    src = fetchFromGitHub {
      owner = "goharbor";
      repo = "harbor";
      rev = "v${version}";
      hash = "sha256-j0Eps47o8OxWaWzvutVIvzj+hX9jmB9qRrPKYNIXfRs=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-j0Eps47o8OxWaWzvutVIvzj+hX9jmB9qRrPKYNIXfRs=";  # TODO: Fix hash after first build

    sourceRoot = "source/src";

    subPackages = [ "cmd/exporter" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/goharbor/harbor/src/common/utils.ReleaseVersion=v${version}"
    ];

    doCheck = false;

    postInstall = ''
      mv $out/bin/exporter $out/bin/harbor-exporter
    '';

    meta = with lib; {
      description = "Harbor Exporter - Prometheus metrics for Harbor";
      homepage = "https://github.com/goharbor/harbor";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = harbor-exporter;
  name = "harbor-exporter";
  tag = "v${version}";
  entrypoint = [ "${harbor-exporter}/bin/harbor-exporter" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert tzdata ];

  env = {
    HARBOR_EXPORTER_PORT = "8001";
  };

  labels = {
    "org.opencontainers.image.title" = "Harbor Exporter";
    "org.opencontainers.image.description" = "Prometheus metrics exporter for Harbor";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "harbor";
  };
}
