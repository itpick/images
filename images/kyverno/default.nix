{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:


# Chainguard SBOM packages for kyverno:
# Packages available in nixpkgs:
#   pkgs.kubectl  # kubectl-1.34 (1.34.2-r3)
#   pkgs.kyverno  # kyverno-1.16 (1.16.1-r0)
# Packages NOT in nixpkgs:
#   kubectl-latest (0-r11)

# Build kyverno v1.13.0 to match the controllers
let
  version = "1.19.2";
  goModBump = import ../../lib/goModBump.nix { inherit lib; };

  kyverno = buildGoModule ({
    pname = "kyverno";
    inherit version;

    src = fetchFromGitHub {
      owner = "kyverno";
      repo = "kyverno";
      rev = "v${version}";
      hash = "sha256-Q94qvOTrGl/82cooREqFAw+G7lY/tnpmaOb1JA2ZYOQ=";
    };

    proxyVendor = true;
    vendorHash = "sha256-BAsSihfNp4EpJkjnM461WNaPpHparzoZYSMu0+LcCaY=";

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
  } // goModBump [
    "github.com/go-jose/go-jose/v4@v4.1.6"
    "github.com/klauspost/compress@v1.20.2"
  ]);

in
mkImage {
  drv = kyverno;
  name = "kyverno";
  tag = "v${version}";
  entrypoint = [ "${kyverno}/bin/kyverno" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "Kyverno";
    "org.opencontainers.image.description" = "Kubernetes native policy engine";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kyverno";
  };
}
