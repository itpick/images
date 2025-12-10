{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:


# Chainguard SBOM packages for kyverno-cleanup-controller:
# Packages available in nixpkgs:
#   pkgs.kubectl  # kubectl-1.34 (1.34.2-r3)
# Packages NOT in nixpkgs:
#   kubectl-latest (0-r11)
#   kyverno-cleanup-controller-1.16 (1.16.1-r0)

let
  version = "1.13.0";
  kyverno-cleanup-controller = buildGoModule {
    pname = "kyverno-cleanup-controller";
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
mkImage {
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
