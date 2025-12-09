{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:


# Chainguard SBOM packages for trust-manager:
# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)

let
  version = "0.12.0";
  trust-manager = buildGoModule {
    pname = "trust-manager";
    inherit version;

    src = fetchFromGitHub {
      owner = "cert-manager";
      repo = "trust-manager";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = null;  # TODO: Update after first build

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/cert-manager/trust-manager/pkg/version.Version=v${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "cert-manager trust bundle manager";
      homepage = "https://github.com/cert-manager/trust-manager";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = trust-manager;
  name = "trust-manager";
  tag = "v${version}";
  entrypoint = [ "${trust-manager}/bin/trust-manager" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "cert-manager Trust Manager";
    "org.opencontainers.image.description" = "Distributes trust bundles across Kubernetes clusters";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "trust-manager";
  };
}
