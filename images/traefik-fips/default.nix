{ mkImage, pkgs, lib, fetchFromGitHub, buildGoModule, ... }:

# Traefik (FIPS) - Cloud native application proxy with FIPS-compliant cryptography
# https://github.com/traefik/traefik
# FIPS-compliant build for FedRAMP compliance

let
  version = "3.2.3";

  traefik-fips = buildGoModule rec {
    pname = "traefik-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "traefik";
      repo = "traefik";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Update hash
    };

    vendorHash = null;  # Uses vendor directory

    subPackages = [ "cmd/traefik" ];

    # Enable FIPS-compliant crypto using Go's boringcrypto experiment
    # This uses Google's BoringSSL (FIPS 140-2 validated) instead of standard crypto
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [
      "-s" "-w"
      "-X github.com/traefik/traefik/v3/pkg/version.Version=${version}"
      "-X github.com/traefik/traefik/v3/pkg/version.Codename=livarot"
    ];

    postInstall = ''
      mv $out/bin/traefik $out/bin/traefik || true
    '';

    doCheck = false;

    # Build with CGO for BoringCrypto support
    nativeBuildInputs = with pkgs; [ go ];

    meta = with lib; {
      description = "Traefik (FIPS) - Cloud native application proxy with FIPS-validated cryptography";
      homepage = "https://traefik.io/";
      license = licenses.mit;
      platforms = platforms.linux;
    };
  };

in
mkImage {
  drv = traefik-fips;
  name = "traefik-fips";
  tag = "v${version}";
  entrypoint = [ "${traefik-fips}/bin/traefik" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "Traefik (FIPS)";
    "org.opencontainers.image.description" = "FIPS-compliant cloud native application proxy and ingress controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "traefik";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
