{ buildCLIImage, fetchFromGitHub, buildGoModule, lib, ... }:

let
  version = "1.13.0";
  kyvernopre = buildGoModule {
    pname = "kyvernopre";
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

    subPackages = [ "cmd/kyverno-init" ];

    postInstall = ''
      mv $out/bin/kyverno-init $out/bin/kyvernopre
    '';

    doCheck = false;

    meta = with lib; {
      description = "Kyverno pre-init container for policy initialization";
      homepage = "https://github.com/kyverno/kyverno";
      license = licenses.asl20;
    };
  };

in
buildCLIImage {
  drv = kyvernopre;
  name = "kyvernopre";
  tag = "v${version}";
  entrypoint = [ "${kyvernopre}/bin/kyvernopre" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Kyverno Pre";
    "org.opencontainers.image.description" = "Kyverno pre-init container";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kyverno";
  };
}
