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

  # The tetratelabs prebuilt envoy expects a standard Linux dynamic
  # loader at /lib64/ld-linux-x86-64.so.2. Our image has no /lib64 —
  # everything lives under /nix/store. autoPatchelfHook rewrites the
  # ELF interp + RPATH to point at nixpkgs' loader/libc, so exec works
  # inside the container.
  envoyInstall = pkgs.stdenv.mkDerivation {
    pname = "envoy-nixchart-install";
    inherit version;
    src = envoyBin;
    nativeBuildInputs = [ pkgs.xz pkgs.autoPatchelfHook ];
    buildInputs = [ pkgs.stdenv.cc.cc.lib ];
    sourceRoot = ".";
    dontConfigure = true;
    dontBuild = true;
    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin $out/etc/envoy
      # Tarball layout: envoy-v${version}-linux-amd64/bin/envoy
      find . -type f -name envoy -executable -exec cp {} $out/bin/envoy \;
      chmod +x $out/bin/envoy
      # Minimal default config so bare `docker run` boots; chart mounts
      # its own envoy.yaml at /etc/envoy/envoy.yaml.
      cat > $out/etc/envoy/envoy.yaml <<'CFG'
      admin:
        address:
          socket_address: { address: 0.0.0.0, port_value: 9901 }
      static_resources:
        listeners:
        - name: default
          address:
            socket_address: { address: 0.0.0.0, port_value: 10000 }
          filter_chains:
          - filters:
            - name: envoy.filters.network.http_connection_manager
              typed_config:
                "@type": type.googleapis.com/envoy.extensions.filters.network.http_connection_manager.v3.HttpConnectionManager
                stat_prefix: ingress
                route_config: { name: default, virtual_hosts: [{ name: local, domains: ["*"], routes: [{ match: { prefix: "/" }, direct_response: { status: 200, body: { inline_string: "ok" } } }] }] }
                http_filters:
                - name: envoy.filters.http.router
                  typed_config: { "@type": type.googleapis.com/envoy.extensions.filters.http.router.v3.Router }
      CFG
      runHook postInstall
    '';
  };

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
    # Chart mounts its own envoy.yaml at /etc/envoy/envoy.yaml; the
    # default cmd points at the same path so bare `docker run` uses the
    # shipped default.
    Cmd = [ "-c" "/etc/envoy/envoy.yaml" ];
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
