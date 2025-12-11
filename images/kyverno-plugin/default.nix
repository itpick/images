# kyverno-plugin
# =============
# Kyverno Plugin for Policy Reporter
# https://github.com/kyverno/policy-reporter-kyverno-plugin

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Chainguard SBOM packages for kyverno-plugin:
# Packages available in nixpkgs:
#   pkgs.kubectl  # kubectl-1.34 (1.34.2-r3)
#   pkgs.kyverno  # kyverno-1.16 (1.16.1-r0)

let
  version = "1.6.4";
  kyverno-plugin = buildGoModule {
    pname = "policy-reporter-kyverno-plugin";
    inherit version;

    src = fetchFromGitHub {
      owner = "kyverno";
      repo = "policy-reporter-kyverno-plugin";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    subPackages = [ "." ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X main.Version=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Kyverno Plugin for Policy Reporter";
      homepage = "https://github.com/kyverno/policy-reporter-kyverno-plugin";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = kyverno-plugin;
  name = "kyverno-plugin";
  tag = "v${version}";
  entrypoint = [ "${kyverno-plugin}/bin/policy-reporter-kyverno-plugin" ];
  cmd = [ "run" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Kyverno Plugin";
    "org.opencontainers.image.description" = "Kyverno Plugin for Policy Reporter";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "policy-reporter";
  };
}
