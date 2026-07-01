{ mkImage, pkgs, lib, fetchFromGitHub, buildGoModule, ... }:

# Atlantis (FIPS) - Terraform Pull Request Automation with FIPS-compliant cryptography
# https://www.runatlantis.io/
# FIPS-compliant build for FedRAMP compliance

let
  version = "0.46.0";

  atlantis-fips = buildGoModule rec {
    pname = "atlantis-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "runatlantis";
      repo = "atlantis";
      rev = "v${version}";
      hash = "sha256-4twWPp+ZgK6YmNL5RJmLKhtxe33T1GDCu1qejUbqXkA=";  # TODO: Update with actual hash
    };

    proxyVendor = true;
    vendorHash = "sha256-QhWE7EYdWM0l2QBhUyC9kxwP3y6cbfd5x8KhNTi99NU=";

    subPackages = [ "." ];

    # Enable FIPS-compliant crypto using Go's boringcrypto experiment
    # This uses Google's BoringSSL (FIPS 140-2 validated) instead of standard crypto
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [
      "-s" "-w"
      "-X main.version=${version}"
    ];

    doCheck = false;

    # Build with CGO for BoringCrypto support
    nativeBuildInputs = with pkgs; [ go ];

    meta = with lib; {
      description = "Atlantis (FIPS) - Terraform Pull Request Automation with FIPS-validated cryptography";
      homepage = "https://www.runatlantis.io/";
      license = licenses.asl20;
      platforms = platforms.linux;
    };
  };

in
mkImage {
  drv = atlantis-fips;
  name = "atlantis-fips";
  tag = "v${version}";
  entrypoint = [ "${atlantis-fips}/bin/atlantis" ];
  cmd = [ "server" ];

  extraPkgs = with pkgs; [
    bash
    git
    openssh
    terraform
    cacert
  ];

  labels = {
    "org.opencontainers.image.title" = "Atlantis (FIPS)";
    "org.opencontainers.image.description" = "FIPS-compliant Terraform Pull Request Automation";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "atlantis";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
