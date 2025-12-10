{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:


# Chainguard SBOM packages for kyverno:
# Packages available in nixpkgs:
#   pkgs.kubectl  # kubectl-1.34 (1.34.2-r3)
#   pkgs.kyverno  # kyverno-1.16 (1.16.1-r0)
# Packages NOT in nixpkgs:
#   kubectl-latest (0-r11)

# Build kyverno v1.13.0 to match the controllers
let
  version = "1.13.0";
  kyverno = buildGoModule {
    pname = "kyverno";
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

    subPackages = [ "cmd/kyverno" ];

    doCheck = false;

    meta = with lib; {
      description = "Kubernetes native policy engine";
      homepage = "https://github.com/kyverno/kyverno";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = kyverno;
  name = "kyverno";
  tag = "v${version}";
  entrypoint = [ "${kyverno}/bin/kyverno" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Kyverno";
    "org.opencontainers.image.description" = "Kubernetes native policy engine";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kyverno";
  };
}
