{ buildCLIImage, fetchFromGitHub, buildGoModule, lib, ... }:

let
  version = "2.16.1";
  keda-admission-webhooks = buildGoModule {
    pname = "keda-admission-webhooks";
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

    subPackages = [ "cmd/webhooks" ];

    postInstall = ''
      mv $out/bin/webhooks $out/bin/keda-admission-webhooks
    '';

    doCheck = false;

    meta = with lib; {
      description = "KEDA admission webhooks for validation";
      homepage = "https://github.com/kedacore/keda";
      license = licenses.asl20;
    };
  };

in
buildCLIImage {
  drv = keda-admission-webhooks;
  name = "keda-admission-webhooks";
  tag = "v${version}";
  entrypoint = [ "${keda-admission-webhooks}/bin/keda-admission-webhooks" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "KEDA Admission Webhooks";
    "org.opencontainers.image.description" = "Admission controller webhooks for KEDA";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "keda";
  };
}
