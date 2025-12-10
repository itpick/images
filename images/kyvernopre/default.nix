{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:


# Chainguard SBOM packages for kyvernopre:
# Packages available in nixpkgs:
#   pkgs.kubectl  # kubectl-1.34 (1.34.2-r3)
# Packages NOT in nixpkgs:
#   kubectl-latest (0-r11)
#   kyverno-init-container-1.16 (1.16.1-r0)

let
  version = "1.13.0";
  kyvernopre = buildGoModule {
    pname = "kyvernopre";
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
mkImage {
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
