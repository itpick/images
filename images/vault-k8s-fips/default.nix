{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# Vault Agent Injector (FIPS) - Kubernetes operator with FIPS-compliant cryptography
# https://github.com/hashicorp/vault-k8s
# FIPS-compliant build for FedRAMP compliance

let
  version = "1.4.1";

  vault-k8s-fips = buildGoModule rec {
    pname = "vault-k8s-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "hashicorp";
      repo = "vault-k8s";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = null;  # TODO: Update after first build

    # Enable FIPS-compliant crypto using Go's boringcrypto experiment
    # This uses Google's BoringSSL (FIPS 140-2 validated) instead of standard crypto
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [
      "-s" "-w"
      "-X github.com/hashicorp/vault-k8s/version.Version=${version}"
    ];

    doCheck = false;

    # Build with CGO for BoringCrypto support
    nativeBuildInputs = with pkgs; [ go ];

    meta = with lib; {
      description = "Vault Agent Injector (FIPS) - Kubernetes operator with FIPS-validated cryptography";
      homepage = "https://github.com/hashicorp/vault-k8s";
      license = licenses.mpl20;
      platforms = platforms.linux;
    };
  };

in
mkImage {
  drv = vault-k8s-fips;
  name = "vault-k8s-fips";
  tag = "v${version}";
  entrypoint = [ "${vault-k8s-fips}/bin/vault-k8s" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ libcap cacert ];

  labels = {
    "org.opencontainers.image.title" = "Vault Agent Injector (FIPS)";
    "org.opencontainers.image.description" = "FIPS-compliant Vault Agent Injector for Kubernetes";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "vault";
    "io.nix-containers.image.fips" = "true";
    "io.nix-containers.image.compliance" = "FIPS-140-2";
  };
}
