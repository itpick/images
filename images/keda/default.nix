{ buildCLIImage, fetchFromGitHub, buildGoModule, lib, ... }:

let
  version = "2.16.1";
  keda = buildGoModule {
    pname = "keda";
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

    subPackages = [ "cmd/operator" ];

    postInstall = ''
      mv $out/bin/operator $out/bin/keda
    '';

    doCheck = false;

    meta = with lib; {
      description = "Kubernetes-based Event Driven Autoscaling";
      homepage = "https://github.com/kedacore/keda";
      license = licenses.asl20;
    };
  };

in
buildCLIImage {
  drv = keda;
  name = "keda";
  tag = "v${version}";
  entrypoint = [ "${keda}/bin/keda" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "KEDA";
    "org.opencontainers.image.description" = "Kubernetes Event-driven Autoscaling";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "keda";
  };
}
