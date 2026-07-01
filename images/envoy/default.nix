# envoy
# =====
# Envoy Proxy - Cloud-native edge and service proxy
# https://www.envoyproxy.io/
#
# Uses pre-built binary from tetratelabs/archive-envoy to avoid 14+ minute compile time.
# Envoy is compiled via Bazel (C++) which takes extremely long.

{ nix2container, pkgs, lib, ... }:

let
  version = "1.38.3";

  # Download Envoy binary from tetratelabs archive
  # This provides stable permalinks for Envoy releases
  envoyBin = pkgs.fetchurl {
    url = "https://github.com/tetratelabs/archive-envoy/releases/download/v${version}/envoy-v${version}-linux-amd64.tar.xz";
    hash = "sha256-iS9N6UdbWqddx5W1W16s8fOSy0irlT1hq9UjGFQVgCk=";
  };

in
nix2container.buildImage {
  name = "envoy";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "envoy-root";
    paths = [
      # Runtime dependencies
      pkgs.bash
      pkgs.coreutils
      pkgs.cacert

      # Install Envoy binary
      (pkgs.runCommand "envoy-install" {
        nativeBuildInputs = [ pkgs.xz ];
      } ''
        mkdir -p $out/bin $out/etc/envoy $out/tmp

        # Extract Envoy (archive has directory structure: envoy-v$version-linux-amd64/bin/envoy)
        tar -xJf ${envoyBin} --strip-components=2 -C $out/bin
        chmod +x $out/bin/envoy

        # Create default config
        cat > $out/etc/envoy/envoy.yaml << 'EOF'
static_resources:
  listeners:
  - name: listener_0
    address:
      socket_address:
        address: 0.0.0.0
        port_value: 10000
    filter_chains:
    - filters:
      - name: envoy.filters.network.http_connection_manager
        typed_config:
          "@type": type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.HttpConnectionManager
          stat_prefix: ingress_http
          route_config:
            name: local_route
            virtual_hosts:
            - name: local_service
              domains: ["*"]
              routes:
              - match:
                  prefix: "/"
                direct_response:
                  status: 200
                  body:
                    inline_string: "Hello from Envoy!"
          http_filters:
          - name: envoy.filters.http.router
            typed_config:
              "@type": type.googleapis.com/envoy.extensions.filters.http.router.v3.Router
admin:
  address:
    socket_address:
      address: 0.0.0.0
      port_value: 9901
EOF
      '')
    ];
    pathsToLink = [ "/bin" "/etc" "/tmp" ];
  };

  config = {
    Entrypoint = [ "/bin/envoy" ];
    Cmd = [ "-c" "/etc/envoy/envoy.yaml" ];
    User = "65532:65532";
    Env = [
      "PATH=/bin"
      "SSL_CERT_FILE=/etc/ssl/certs/ca-bundle.crt"
    ];
    ExposedPorts = {
      "10000/tcp" = {};
      "9901/tcp" = {};
    };
    Labels = {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "Envoy";
      "org.opencontainers.image.description" = "Cloud-native edge and service proxy (binary download)";
      "org.opencontainers.image.version" = version;
      "org.opencontainers.image.url" = "https://www.envoyproxy.io/";
      "io.nix-containers.binary-download" = "true";
      "io.nix-containers.chart" = "envoy";
    };
  };
}
