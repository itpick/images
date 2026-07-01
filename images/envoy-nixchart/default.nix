{ nix2container, pkgs, lib, ... }:

# envoy-nixchart
# ==============
# Envoy Proxy for consumption by the charts/envoy chart. Uses the
# pre-built binary from tetratelabs/archive-envoy — same source as
# images/envoy/ — since compiling from source via Bazel/C++ takes hours.
#
# Chart supplies envoy.yaml via ConfigMap.

let
  version = "1.38.3";

  envoyBin = pkgs.fetchurl {
    url = "https://github.com/tetratelabs/archive-envoy/releases/download/v${version}/envoy-v${version}-linux-amd64.tar.xz";
    hash = "sha256-iS9N6UdbWqddx5W1W16s8fOSy0irlT1hq9UjGFQVgCk=";
  };

  envoyInstall = pkgs.runCommand "envoy-nixchart-install" {
    nativeBuildInputs = [ pkgs.xz ];
  } ''
    mkdir -p $out/bin
    tar -xJf ${envoyBin} --strip-components=2 -C $out/bin
    chmod +x $out/bin/envoy
  '';

in
nix2container.buildImage {
  name = "envoy-nixchart";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "envoy-nixchart-root";
    paths = [ pkgs.bash pkgs.coreutils pkgs.cacert envoyInstall ];
    pathsToLink = [ "/bin" "/etc" ];
  };

  config = {
    Entrypoint = [ "/bin/envoy" ];
    Cmd = [];
    User = "1001:0";
    Env = [
      "PATH=/bin"
      "SSL_CERT_FILE=/etc/ssl/certs/ca-bundle.crt"
    ];
    Labels = {
      "org.opencontainers.image.title" = "envoy-nixchart";
      "org.opencontainers.image.description" = "Envoy proxy tuned for the nix-containers charts/envoy chart";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.binary-download" = "true";
      "io.nix-containers.chart" = "envoy";
    };
  };
}
