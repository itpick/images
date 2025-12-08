{ buildCLIImage, fetchFromGitHub, buildGoModule, lib, ... }:

let
  version = "1.13.0";
  kyverno-cleanup-controller = buildGoModule {
    pname = "kyverno-cleanup-controller";
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

    subPackages = [ "cmd/cleanup-controller" ];

    postInstall = ''
      mv $out/bin/cleanup-controller $out/bin/kyverno-cleanup-controller
    '';

    doCheck = false;

    meta = with lib; {
      description = "Kyverno cleanup controller for resource cleanup policies";
      homepage = "https://github.com/kyverno/kyverno";
      license = licenses.asl20;
    };
  };

in
buildCLIImage {
  drv = kyverno-cleanup-controller;
  name = "kyverno-cleanup-controller";
  tag = "v${version}";
  entrypoint = [ "${kyverno-cleanup-controller}/bin/kyverno-cleanup-controller" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Kyverno Cleanup Controller";
    "org.opencontainers.image.description" = "Resource cleanup policy controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kyverno";
  };
}
