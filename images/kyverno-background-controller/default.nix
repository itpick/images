{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:

let
  version = "1.13.0";
  kyverno-background-controller = buildGoModule {
    pname = "kyverno-background-controller";
    inherit version;

    src = fetchFromGitHub {
      owner = "kyverno";
      repo = "kyverno";
      rev = "v${version}";
      hash = "sha256-l9UAPXBSRQJJtPMpyRkVsKWKFrvNiP8nEBfXMo+cvzE=";
    };

    proxyVendor = true;
    vendorHash = "sha256-oh0Rw2ApnIF52jBd0l/SuMUbM6t6XdVHZpwHFU8P6nY=";

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/kyverno/kyverno/pkg/version.BuildVersion=${version}"
    ];

    subPackages = [ "cmd/background-controller" ];

    postInstall = ''
      mv $out/bin/background-controller $out/bin/kyverno-background-controller
    '';

    doCheck = false;

    meta = with lib; {
      description = "Kyverno background controller for policy processing";
      homepage = "https://github.com/kyverno/kyverno";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = kyverno-background-controller;
  name = "kyverno-background-controller";
  tag = "v${version}";
  entrypoint = [ "${kyverno-background-controller}/bin/kyverno-background-controller" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Kyverno Background Controller";
    "org.opencontainers.image.description" = "Background policy processing controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kyverno";
  };
}
