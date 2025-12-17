{ mkImage, pkgs, lib, fetchFromGitHub, buildGoModule, ... }:

# HashiCorp Vault (FIPS) - Secrets management with FIPS-compliant cryptography
# https://github.com/hashicorp/vault
# FIPS-compliant build for FedRAMP compliance

let
  version = pkgs.vault.version;

  vault-fips = buildGoModule rec {
    pname = "vault-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "hashicorp";
      repo = "vault";
      rev = "v${version}";
      hash = "sha256-5CqA2dZZdV1IiGSGwCA2eQIhp3lrsDIJt4rDK1vdvmE=";
    };

    vendorHash = null;  # TODO: Update after first build

    subPackages = [ "." ];

    # Enable FIPS-compliant crypto using Go's boringcrypto experiment
    # This uses Google's BoringSSL (FIPS 140-2 validated) instead of standard crypto
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [
      "-s" "-w"
      "-X github.com/hashicorp/vault/sdk/version.Version=${version}"
      "-X github.com/hashicorp/vault/sdk/version.GitCommit=unknown"
    ];

    doCheck = false;

    # Build with CGO for BoringCrypto support
    nativeBuildInputs = with pkgs; [ go ];

    meta = with lib; {
      description = "HashiCorp Vault (FIPS) - Secrets management with FIPS-validated cryptography";
      homepage = "https://www.vaultproject.io/";
      license = licenses.bsl11;
      platforms = platforms.linux;
    };
  };

in
mkImage {
  drv = vault-fips;
  name = "vault-fips";
  tag = version;
  entrypoint = [ "${vault-fips}/bin/vault" ];
  cmd = [ "server" "--help" ];

  extraPkgs = with pkgs; [ busybox dumb-init libcap su-exec cacert ];

  env = {
    VAULT_ADDR = "http://127.0.0.1:8200";
    SKIP_SETCAP = "1";
  };

  labels = {
    "org.opencontainers.image.title" = "HashiCorp Vault (FIPS)";
    "org.opencontainers.image.description" = "FIPS-compliant secrets management and data protection";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "vault";
    "io.nix-containers.image.fips" = "true";
    "io.nix-containers.image.compliance" = "FIPS-140-2";
  };
}
