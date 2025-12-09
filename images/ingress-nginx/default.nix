{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:


# Chainguard SBOM packages for ingress-nginx:
# Packages available in nixpkgs:
#   pkgs.brotli  # brotli (1.2.0-r1)
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.c-ares  # c-ares (1.34.5-r3)
#   pkgs.cyrus_sasl  # cyrus-sasl (2.1.28-r45)
#   pkgs.freetype  # freetype (2.14.1-r0)
#   pkgs.gd  # gd (2.3.3-r12)
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.geoip  # geoip (1.6.12-r7)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.grpc  # grpc-1.76 (1.76.0-r2)
#   pkgs.gtest  # gtest (1.17.0-r3)
#   pkgs.libavif  # libavif (1.3.0-r2)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libice  # libice (1.1.2-r2)
#   pkgs.libidn2  # libidn2 (2.3.8-r3)
#   pkgs.libjpeg_turbo  # libjpeg-turbo (3.1.2-r1)
#   pkgs.libmaxminddb  # libmaxminddb (1.12.2-r3)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libpng  # libpng (1.6.52-r0)
#   pkgs.libpsl  # libpsl (0.21.5-r6)
#   pkgs.libsm  # libsm (1.2.6-r1)
#   pkgs.libunistring  # libunistring (1.4.1-r1)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.libverto  # libverto (0.3.2-r6)
#   pkgs.libwebp  # libwebp (1.6.0-r1)
#   pkgs.libx11  # libx11 (1.8.12-r3)
#   pkgs.libxau  # libxau (1.0.12-r3)
#   pkgs.libxcb  # libxcb (1.17.0-r8)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   ... and 21 more
# Packages NOT in nixpkgs:
#   aom-libs (3.13.1-r0)
#   ca-certificates (20251003-r0)
#   dumb-init-privileged-netbindservice (1.2.5-r9)
#   fontconfig-config (2.17.1-r1)
#   gmock (1.17.0-r3)
#   heimdal-libs (7.8.0-r42)
#   icu78-data-full (78.1-r0)
#   ingress-nginx-controller-1.14 (1.14.0-r1)
#   ingress-nginx-opentelemetry-plugin-1.14 (1.14.0-r1)
#   jitterentropy-library (3.6.3-r2)
#   jitterentropy-library-dev (3.6.3-r2)
#   keyutils-libs (1.6.3-r37)
#   krb5-conf (1.0-r7)
#   krb5-libs (1.22.1-r1)
#   ld-linux (2.42-r4)
#   libabsl2508.0.0 (20250814.1-r1)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbrotlienc1 (1.2.0-r1)
#   libbz2-1 (1.0.8-r21)
#   ... and 38 more

let
  version = "1.12.0";
  ingress-nginx = buildGoModule {
    pname = "ingress-nginx";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "ingress-nginx";
      rev = "controller-v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = null;  # TODO: Update after first build

    subPackages = [ "cmd/nginx" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X k8s.io/ingress-nginx/version.RELEASE=v${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "NGINX Ingress Controller for Kubernetes";
      homepage = "https://github.com/kubernetes/ingress-nginx";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = ingress-nginx;
  name = "ingress-nginx";
  tag = "v${version}";
  entrypoint = [ "${ingress-nginx}/bin/nginx" ];
  cmd = [];

  extraPkgs = with pkgs; [ busybox libcap ];

  labels = {
    "org.opencontainers.image.title" = "NGINX Ingress Controller";
    "org.opencontainers.image.description" = "Kubernetes NGINX ingress controller";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "ingress-nginx";
  };
}
