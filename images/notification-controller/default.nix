{ buildCLIImage, fetchFromGitHub, buildGoModule, lib, ... }:

let
  version = "1.7.5";
  notification-controller = buildGoModule {
    pname = "notification-controller";
    inherit version;

    src = fetchFromGitHub {
      owner = "fluxcd";
      repo = "notification-controller";
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
      description = "Flux notification-controller for event handling and alerting";
      homepage = "https://github.com/fluxcd/notification-controller";
      license = licenses.asl20;
    };
  };

in
buildCLIImage {
  drv = notification-controller;
  name = "notification-controller";
  tag = "v${version}";
  entrypoint = [ "${notification-controller}/bin/notification-controller" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Flux Notification Controller";
    "org.opencontainers.image.description" = "Handles events and sends alerts";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "flux2";
  };
}
