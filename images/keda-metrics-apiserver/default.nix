{ buildCLIImage, fetchFromGitHub, buildGoModule, lib, ... }:

let
  version = "2.16.1";
  keda-metrics-apiserver = buildGoModule {
    pname = "keda-metrics-apiserver";
    inherit version;

    src = fetchFromGitHub {
      owner = "kedacore";
      repo = "keda";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = null;  # TODO: Update after first build

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/kedacore/keda/v2/version.Version=${version}"
    ];

    subPackages = [ "cmd/adapter" ];

    postInstall = ''
      mv $out/bin/adapter $out/bin/keda-metrics-apiserver
    '';

    doCheck = false;

    meta = with lib; {
      description = "KEDA Metrics API Server for custom metrics";
      homepage = "https://github.com/kedacore/keda";
      license = licenses.asl20;
    };
  };

in
buildCLIImage {
  drv = keda-metrics-apiserver;
  name = "keda-metrics-apiserver";
  tag = "v${version}";
  entrypoint = [ "${keda-metrics-apiserver}/bin/keda-metrics-apiserver" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "KEDA Metrics API Server";
    "org.opencontainers.image.description" = "Kubernetes custom metrics server for KEDA";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "keda";
  };
}
