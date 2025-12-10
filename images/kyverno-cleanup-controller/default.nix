{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:


# Chainguard SBOM packages for kyverno-cleanup-controller:
# Packages available in nixpkgs:
#   pkgs.kubectl  # kubectl-1.34 (1.34.2-r3)
# Packages NOT in nixpkgs:
#   kubectl-latest (0-r11)
#   kyverno-cleanup-controller-1.16 (1.16.1-r0)

let
  version = "1.16.1";
  kyverno-cleanup-controller = buildGoModule {
    pname = "kyverno-cleanup-controller";
    inherit version;

    src = fetchFromGitHub {
      owner = "kyverno";
      repo = "kyverno";
      rev = "v${version}";
      hash = "sha256-frLuq91CWjyNSj5HFvYIsyR6NFvZqXLil3YQL5Tli6o=";
    };

    proxyVendor = true;
    vendorHash = "sha256-gdv3QReFGDhVjaJgtSCYlYuDoJwDx9FNPDn1hl0brp8=";

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
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "Kyverno Cleanup Controller";
    "org.opencontainers.image.description" = "Resource cleanup policy controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kyverno";
  };
}
