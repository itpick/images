{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:


# Chainguard SBOM packages for node-local-dns:
# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.c-ares  # c-ares (1.34.5-r3)
#   pkgs.dumb-init  # dumb-init (1.2.5-r9)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libev  # libev (4.33-r9)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libnghttp2  # libnghttp2-14 (1.68.0-r0)
#   pkgs.libuv  # libuv (1.51.0-r2)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
#   pkgs.nghttp2  # nghttp2 (1.68.0-r0)
#   pkgs.nodejs  # nodejs-25 (25.2.1-r0)
#   pkgs.npm-check  # npm (11.6.4-r0)
#   pkgs.zlib  # zlib (1.3.1-r51)
# Packages NOT in nixpkgs:
#   icu78-data-full (78.1-r0)
#   ld-linux (2.42-r4)
#   libbrotlicommon1 (1.2.0-r1)
#   libbrotlidec1 (1.2.0-r1)
#   libbrotlienc1 (1.2.0-r1)
#   libcrypt1 (2.42-r4)
#   libcrypto3 (3.6.0-r4)
#   libicu78 (78.1-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)

let
  version = "1.26.0";
  node-local-dns = buildGoModule {
    pname = "node-local-dns";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "dns";
      rev = "${version}";
      hash = "sha256-Rlke8bN+89UnlY0srtqzrsmKhYHW+36hsHghKs7g+gM=";  # TODO: Fix hash after first build
    };

    vendorHash = null;  # TODO: Update after first build

    subPackages = [ "cmd/node-cache" ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/kubernetes/dns/pkg/version.Version=v${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "NodeLocal DNS cache";
      homepage = "https://github.com/kubernetes/dns";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = node-local-dns;
  name = "node-local-dns";
  tag = "${version}";
  entrypoint = [ "${node-local-dns}/bin/node-cache" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "NodeLocal DNS Cache";
    "org.opencontainers.image.description" = "Node-level DNS caching daemon";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "node-local-dns";
  };
}
