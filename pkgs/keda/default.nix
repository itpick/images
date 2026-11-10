{ lib, fetchFromGitHub, buildGoModule }:

# Built from wolfi-dev/os keda-2.18.yaml
# https://github.com/kedacore/keda
# Builds all 3 KEDA binaries: keda (operator), keda-adapter, keda-admission-webhooks

let
  goModBump = import ../../lib/goModBump.nix { inherit lib; };
in
buildGoModule (rec {
  pname = "keda";
  version = "2.21.0";

  src = fetchFromGitHub {
    owner = "kedacore";
    repo = "keda";
    rev = "v${version}";
    hash = "sha256-P/039bvT7xK8lv3YTDdOWmn8T1Olk08zizpstODAkqg=";
  };

  # KEDA commits a vendor/ tree whose modules.txt fails Go >= 1.27's
  # explicit-requirement check. Drop it and fetch modules via the proxy.
  postPatch = "rm -rf vendor";
  proxyVendor = true;
  vendorHash = "sha256-3PVj9a6rcneUW2SBaUIrCunrM/kx6tdS1GKlfAth2hc=";

  # Build all 3 components
  subPackages = [
    "cmd/operator"
    "cmd/adapter"
    "cmd/webhooks"
  ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/kedacore/keda/v2/version.Version=${version}"
    "-X github.com/kedacore/keda/v2/version.GitCommit=875675ce"
  ];

  # Rename binaries to match expected names
  postInstall = ''
    mv $out/bin/operator $out/bin/keda
    mv $out/bin/adapter $out/bin/keda-adapter
    mv $out/bin/webhooks $out/bin/keda-admission-webhooks
  '';

  doCheck = false;

  meta = with lib; {
    description = "KEDA is a Kubernetes-based Event Driven Autoscaling component";
    homepage = "https://github.com/kedacore/keda";
    license = licenses.asl20;
  };
} // goModBump [
  "github.com/andybalholm/brotli@v1.2.7"
  "github.com/go-jose/go-jose/v4@v4.1.6"
  "github.com/klauspost/compress@v1.20.2"
  "golang.org/x/net@v0.62.0"
])
