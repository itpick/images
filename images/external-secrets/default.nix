{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:


# Chainguard SBOM packages for external-secrets:
# Packages NOT in nixpkgs:
#   external-secrets-operator-1.1 (1.1.1-r0)

let
  version = "0.10.0";
  external-secrets = buildGoModule {
    pname = "external-secrets";
    inherit version;

    src = fetchFromGitHub {
      owner = "external-secrets";
      repo = "external-secrets";
      rev = "v${version}";
      hash = "sha256-Yz4MOQ9qf72QlwksrM69mHTMOYBXCkIRrklegOTQb7E=";
    };

    proxyVendor = true;
    vendorHash = "sha256-B1oG/IfG/QZipK4PIPNOm1G9nYpZT9lHhKoDDfHwswU=";

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
mkImage {
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
