{ mkImage, pkgs, lib, fetchFromGitHub, buildGoModule, ... }:

# Crossplane (FIPS) - Cloud Native Control Plane with FIPS-compliant cryptography
# https://github.com/crossplane/crossplane
# FIPS-compliant build for FedRAMP compliance

let
  version = "2.1.3";

  crossplane-fips = buildGoModule rec {
    pname = "crossplane-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "crossplane";
      repo = "crossplane";
      rev = "v${version}";
      hash = "sha256-ODqNay4wmbo770ZBpGSH/Zm2Y2vVmUC6PfTzv9CyZns=";
    };

    vendorHash = "sha256-90TwfDBb5COEGqjDIoUrZVWS/N8A14ZxbrvvFVgMTNU=";

    subPackages = [ "cmd/crossplane" ];

    # Enable FIPS-compliant crypto using Go's boringcrypto experiment
    # This uses Google's BoringSSL (FIPS 140-2 validated) instead of standard crypto
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [
      "-s"
      "-w"
      "-X github.com/crossplane/crossplane/v2/internal/version.version=v${version}"
    ];

    # Include the cluster directory required by crossplane init
    # crossplane core init expects /crds and /webhookconfigurations at root
    postInstall = ''
      mkdir -p $out/crds $out/webhookconfigurations
      cp -r $src/cluster/crds/* $out/crds/
      cp -r $src/cluster/webhookconfigurations/* $out/webhookconfigurations/
    '';

    # Build with CGO for BoringCrypto support
    nativeBuildInputs = with pkgs; [ go ];

    doCheck = false;

    meta = with lib; {
      description = "Crossplane (FIPS) - Cloud Native Control Plane with FIPS-validated cryptography";
      homepage = "https://crossplane.io/";
      license = licenses.asl20;
      mainProgram = "crossplane";
      platforms = platforms.linux;
    };
  };

  # Create /crds and /webhookconfigurations directories at container root
  # crossplane init expects both directories at filesystem root
  clusterFiles = pkgs.runCommand "crossplane-cluster-files" {} ''
    mkdir -p $out/crds $out/webhookconfigurations
    cp -r ${crossplane-fips}/crds/* $out/crds/
    cp -r ${crossplane-fips}/webhookconfigurations/* $out/webhookconfigurations/
  '';

in

# Crossplane FIPS variant - builds from source with GOEXPERIMENT=boringcrypto
# for FIPS 140-2 compliance. The standard crossplane binary uses Go's
# standard crypto libraries, while this FIPS variant uses BoringSSL.
#
# The crossplane helm chart runs:
#   - Init container: crossplane core init --activation *
#   - Main container: crossplane core start

mkImage {
  drv = crossplane-fips;
  name = "crossplane-fips";
  tag = "v${version}";
  entrypoint = [ "${crossplane-fips}/bin/crossplane" ];
  # No default cmd - helm chart provides "core start" or "core init" as args
  cmd = [];
  # Include cluster files (/crds and /webhookconfigurations) at container root
  extraContents = [ clusterFiles ];

  labels = {
    "org.opencontainers.image.title" = "Crossplane (FIPS)";
    "org.opencontainers.image.description" = "FIPS-compliant Cloud Native Control Plane";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "crossplane";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
