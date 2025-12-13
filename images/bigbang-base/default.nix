# bigbang-base
# =============
# BigBang Base - Utility container with essential CLI tools
# Based on: registry1.dso.mil/ironbank/big-bang/base
# https://repo1.dso.mil/dsop/big-bang/base
#
# Upstream base: registry1.dso.mil/ironbank/redhat/ubi/ubi9-minimal:9.7
# Installed packages: jq, curl, kubectl, yq, pinentry, findutils, which, gnutls

{ mkImage, pkgs, nonRoot, lib, ... }:

# BigBang base image is a UBI9-minimal-based utility container with:
# - curl: HTTP requests
# - kubectl: Kubernetes CLI
# - yq: YAML processor
# - jq: JSON processor
# - pinentry, findutils, which: additional utilities

let
  version = "2.1.0";
in
mkImage {
  # Use bash as the primary derivation
  drv = pkgs.bash;
  name = "bigbang-base";
  tag = version;

  # Include all the essential tools matching upstream
  # Note: 'which' is provided by busybox, so we don't include it separately
  extraPkgs = with pkgs; [
    curl
    kubectl
    yq-go
    jq
    pinentry-curses  # pinentry was removed, use pinentry-curses
    findutils
    # which - provided by busybox
    gnutls
    cacert
    tzdata
    coreutils
  ];

  entrypoint = [ "${pkgs.bash}/bin/bash" ];
  cmd = [];

  env = {
    KUBECONFIG = "/home/${nonRoot.user.name}/.kube/config";
    LANG = "C.UTF-8";
  };

  # Run as non-root user like upstream (base:1000)
  user = nonRoot.userString;

  labels = {
    "org.opencontainers.image.title" = "BigBang Base";
    "org.opencontainers.image.description" = "Utility container with curl, kubectl, yq, and jq";
    "org.opencontainers.image.version" = version;
    "org.opencontainers.image.source" = "https://repo1.dso.mil/dsop/big-bang/base";
    "io.nix-containers.chart" = "bigbang";
    "io.nix-containers.upstream" = "registry1.dso.mil/ironbank/big-bang/base";
  };
}
