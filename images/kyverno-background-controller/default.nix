{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:

let
  version = "1.18.1";
  kyverno-background-controller = buildGoModule {
    pname = "kyverno-background-controller";
    inherit version;

    src = fetchFromGitHub {
      owner = "kyverno";
      repo = "kyverno";
      rev = "v${version}";
      hash = "sha256-zo02ABieJ+CykuqGJlnthXibgBzNGB3t3UdlKMTIkFo=";
    };

    proxyVendor = true;
    vendorHash = "sha256-oE6/xyznEtAAoypMICvjDB3hOhXCK1VelrV/zJuBeZA=";

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
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "Kyverno Background Controller";
    "org.opencontainers.image.description" = "Background policy processing controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kyverno";
  };
}
