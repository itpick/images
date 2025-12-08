{ buildCLIImage, fetchFromGitHub, buildGoModule, lib, ... }:

let
  version = "1.7.4";
  source-controller = buildGoModule {
    pname = "source-controller";
    inherit version;

    src = fetchFromGitHub {
      owner = "fluxcd";
      repo = "source-controller";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = null;  # TODO: Update after first build

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.VERSION=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Flux source-controller for fetching resources from external sources";
      homepage = "https://github.com/fluxcd/source-controller";
      license = licenses.asl20;
    };
  };

in
buildCLIImage {
  drv = source-controller;
  name = "source-controller";
  tag = "v${version}";
  entrypoint = [ "${source-controller}/bin/source-controller" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Flux Source Controller";
    "org.opencontainers.image.description" = "Fetches resources from external sources";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "flux2";
  };
}
