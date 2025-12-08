{ buildCLIImage, fetchFromGitHub, buildGoModule, lib, ... }:

let
  version = "1.13.0";
  kyverno-reports-controller = buildGoModule {
    pname = "kyverno-reports-controller";
    inherit version;

    src = fetchFromGitHub {
      owner = "kyverno";
      repo = "kyverno";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = null;  # TODO: Update after first build

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/kyverno/kyverno/pkg/version.BuildVersion=${version}"
    ];

    subPackages = [ "cmd/reports-controller" ];

    postInstall = ''
      mv $out/bin/reports-controller $out/bin/kyverno-reports-controller
    '';

    doCheck = false;

    meta = with lib; {
      description = "Kyverno reports controller for policy reports";
      homepage = "https://github.com/kyverno/kyverno";
      license = licenses.asl20;
    };
  };

in
buildCLIImage {
  drv = kyverno-reports-controller;
  name = "kyverno-reports-controller";
  tag = "v${version}";
  entrypoint = [ "${kyverno-reports-controller}/bin/kyverno-reports-controller" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Kyverno Reports Controller";
    "org.opencontainers.image.description" = "Policy reports controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kyverno";
  };
}
