{ buildCLIImage, fetchFromGitHub, buildGoModule, lib, ... }:

let
  version = "1.7.3";
  kustomize-controller = buildGoModule {
    pname = "kustomize-controller";
    inherit version;

    src = fetchFromGitHub {
      owner = "fluxcd";
      repo = "kustomize-controller";
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
      description = "Flux kustomize-controller for applying Kustomize overlays";
      homepage = "https://github.com/fluxcd/kustomize-controller";
      license = licenses.asl20;
    };
  };

in
buildCLIImage {
  drv = kustomize-controller;
  name = "kustomize-controller";
  tag = "v${version}";
  entrypoint = [ "${kustomize-controller}/bin/kustomize-controller" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Flux Kustomize Controller";
    "org.opencontainers.image.description" = "Applies Kustomize overlays to Kubernetes";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "flux2";
  };
}
