{ buildCLIImage, fetchFromGitHub, buildGoModule, lib, ... }:

let
  version = "1.2.1";
  reloader = buildGoModule {
    pname = "reloader";
    inherit version;

    src = fetchFromGitHub {
      owner = "stakater";
      repo = "Reloader";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = null;  # TODO: Update after first build

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.version=v${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Kubernetes controller to watch changes in ConfigMap and Secrets";
      homepage = "https://github.com/stakater/Reloader";
      license = licenses.asl20;
    };
  };

in
buildCLIImage {
  drv = reloader;
  name = "reloader";
  tag = "v${version}";
  entrypoint = [ "${reloader}/bin/Reloader" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "Reloader";
    "org.opencontainers.image.description" = "Watches ConfigMaps and Secrets and triggers rolling upgrades";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "reloader";
  };
}
