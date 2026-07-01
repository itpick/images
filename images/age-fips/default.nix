{ mkImage, pkgs, lib, fetchFromGitHub, buildGoModule, ... }:

# age-fips - Modern encryption tool with small explicit keys (FIPS-compliant)
# https://github.com/FiloSottile/age
# FIPS-compliant build using BoringCrypto

let
  version = "1.3.1";

  age-fips = buildGoModule rec {
    pname = "age-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "FiloSottile";
      repo = "age";
      rev = "v${version}";
      hash = "sha256-Qs/q3zQYV0PukABBPf/aU5V1oOhw95NG6K301VYJk8A=";
    };

    vendorHash = "sha256-iVDkYXXR2pXlUVywPgVRNMORxOOEhAmzpSM0xqSQMSQ=";

    subPackages = [ "cmd/age" "cmd/age-keygen" ];

    # Enable FIPS-compliant crypto using Go's boringcrypto experiment
    # This uses Google's BoringSSL (FIPS 140-2 validated) instead of standard crypto
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [
      "-s" "-w"
      "-X main.Version=${version}"
    ];

    doCheck = false;

    # Build with CGO for BoringCrypto support
    nativeBuildInputs = with pkgs; [ go ];

    meta = with lib; {
      description = "Modern encryption tool with small explicit keys (FIPS-compliant build)";
      homepage = "https://github.com/FiloSottile/age";
      license = licenses.bsd3;
      platforms = platforms.linux;
      mainProgram = "age";
    };
  };

in
mkImage {
  drv = age-fips;
  name = "age-fips";
  tag = "v${version}";
  entrypoint = [ "${age-fips}/bin/age" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [
    cacert
  ];

  labels = {
    "org.opencontainers.image.title" = "age-fips";
    "org.opencontainers.image.description" = "Modern encryption tool with small explicit keys (FIPS-compliant)";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    "io.nix-containers.chart" = "age-fips";
  };
}
