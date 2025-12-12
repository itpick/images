{ mkImage, fetchFromGitHub, buildGoModule, lib, pkgs, busybox, libcap, ... }:

# NGINX Ingress Controller (FIPS) - Kubernetes ingress controller with FIPS-compliant cryptography
# https://github.com/kubernetes/ingress-nginx
# FIPS-compliant build for FedRAMP compliance

let
  version = "1.12.0";

  ingress-nginx-fips = buildGoModule {
    pname = "ingress-nginx-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "ingress-nginx";
      rev = "controller-v${version}";
      hash = "sha256-4/mh5xRgRDwJbRX4PUySR/j7x1YP1m3GzsOw2GJIYuo=";
    };

    proxyVendor = true;
    vendorHash = "sha256-ibmHPsclanHVby62uhrWPIFYzqiYiINDvkaNyUsCJ9U=";

    subPackages = [ "cmd/nginx" ];

    # Enable FIPS-compliant crypto using Go's boringcrypto experiment
    # This uses Google's BoringSSL (FIPS 140-2 validated) instead of standard crypto
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [
      "-s" "-w"
      "-X k8s.io/ingress-nginx/version.RELEASE=v${version}"
    ];

    doCheck = false;

    # Build with CGO for BoringCrypto support
    nativeBuildInputs = with pkgs; [ go ];

    meta = with lib; {
      description = "NGINX Ingress Controller (FIPS) - Kubernetes NGINX ingress with FIPS-validated cryptography";
      homepage = "https://github.com/kubernetes/ingress-nginx";
      license = licenses.asl20;
      platforms = platforms.linux;
    };
  };

in
mkImage {
  drv = ingress-nginx-fips;
  name = "ingress-nginx-fips";
  tag = "v${version}";
  entrypoint = [ "${ingress-nginx-fips}/bin/nginx" ];
  cmd = [];

  extraPkgs = [ busybox libcap pkgs.cacert ];

  labels = {
    "org.opencontainers.image.title" = "NGINX Ingress Controller (FIPS)";
    "org.opencontainers.image.description" = "FIPS-compliant Kubernetes NGINX ingress controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "ingress-nginx";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
