{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:


# Chainguard SBOM packages for kyverno-reports-controller:
# Packages available in nixpkgs:
#   pkgs.kubectl  # kubectl-1.34 (1.34.2-r3)
# Packages NOT in nixpkgs:
#   kubectl-latest (0-r11)
#   kyverno-reports-controller-1.16 (1.16.1-r0)

let
  version = "1.16.1";
  kyverno-reports-controller = buildGoModule {
    pname = "kyverno-reports-controller";
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

    subPackages = [ "cmd/reports-controller" ];

    postInstall = ''
      mv $out/bin/reports-controller $out/bin/kyverno-reports-controller
    '';

    doCheck = false;

    meta = with lib; {
      description = "Kyverno reports controller for policy reports";
      homepage = "https://github.com/kyverno/kyverno";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = kyverno-reports-controller;
  name = "kyverno-reports-controller";
  tag = "v${version}";
  entrypoint = [ "${kyverno-reports-controller}/bin/kyverno-reports-controller" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "Kyverno Reports Controller";
    "org.opencontainers.image.description" = "Policy reports controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kyverno";
  };
}
