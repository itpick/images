# keycloak-proxy
# =============
# Keycloak Proxy - Authentication proxy for Keycloak
# https://github.com/keycloak/keycloak

{ nix2container, pkgs, lib, ... }:

# Keycloak Proxy provides authentication proxy capabilities using Keycloak
# Note: This is based on the Keycloak server running in proxy mode

let
  version = "26.4.7";

in
nix2container.buildImage {
  name = "keycloak-proxy";
  tag = "v${version}";

  copyToRoot = pkgs.buildEnv {
    name = "keycloak-proxy-root";
    paths = with pkgs; [
      # Java runtime
      openjdk21_headless

      # Keycloak
      keycloak

      # Shell and utilities
      bash
      busybox
      coreutils

      # SSL/TLS
      cacert

      # Create directories
      (pkgs.runCommand "keycloak-proxy-dirs" {} ''
        mkdir -p $out/opt/keycloak
        mkdir -p $out/tmp
      '')
    ];
    pathsToLink = [ "/bin" "/etc" "/lib" "/share" "/opt" "/tmp" ];
  };

  config = {
    entrypoint = [ "${pkgs.keycloak}/bin/kc.sh" ];
    cmd = [ "start" "--proxy=edge" ];
    workingDir = "/opt/keycloak";
    exposedPorts = {
      "8080/tcp" = {};
      "8443/tcp" = {};
    };
    env = [
      "KC_PROXY=edge"
      "JAVA_HOME=${pkgs.openjdk21_headless}"
    ];
    labels = {
      "org.opencontainers.image.title" = "Keycloak Proxy";
      "org.opencontainers.image.description" = "Authentication proxy for Keycloak";
      "org.opencontainers.image.version" = version;
      "io.nix-containers.chart" = "keycloak";
    };
  };
}
