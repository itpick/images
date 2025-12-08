{ buildCLIImage, fetchFromGitHub, buildGoModule, lib, ... }:

let
  version = "0.10.0";
  external-secrets = buildGoModule {
    pname = "external-secrets";
    inherit version;

    src = fetchFromGitHub {
      owner = "external-secrets";
      repo = "external-secrets";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = null;  # TODO: Update after first build

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/external-secrets/external-secrets/pkg/version.Version=${version}"
    ];

    subPackages = [ "." ];

    postInstall = ''
      mv $out/bin/external-secrets $out/bin/external-secrets
    '';

    doCheck = false;

    meta = with lib; {
      description = "Kubernetes operator that integrates external secret management systems";
      homepage = "https://github.com/external-secrets/external-secrets";
      license = licenses.asl20;
    };
  };

in
buildCLIImage {
  drv = external-secrets;
  name = "external-secrets";
  tag = "v${version}";
  entrypoint = [ "${external-secrets}/bin/external-secrets" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "External Secrets Operator";
    "org.opencontainers.image.description" = "Kubernetes operator that integrates external secret management systems";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "external-secrets";
  };
}
