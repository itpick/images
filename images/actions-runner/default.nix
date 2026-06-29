{ mkImage, pkgs, lib, ... }:

# GitHub Actions Runner - self-hosted runner for GitHub Actions
# https://github.com/actions/runner
#
# This image bakes Nix into the runner so every workflow doesn't have to
# spend 30-60s per job re-installing it. Previously, every job that needs
# Nix (which is essentially all of them — we publish ~3000 Nix-built
# OCI images) started with a DeterminateSystems/nix-installer-action step
# that downloaded ~100MB and configured the daemon from scratch. At ~600
# jobs/day, that's hours of wasted wall-time daily.
#
# What's baked in:
#   * The GitHub Actions runner binary
#   * Nix CLI (pkgs.nix) — available as `nix` on PATH out of the box
#   * cacert so Nix can talk to HTTPS substituters
#   * /etc/nix/nix.conf preconfigured with flakes + nix-command
#     experimental features and a generous build timeout
#
# What's NOT baked in (intentionally):
#   * determinate-nixd — only flakehub-publish.yml needs this. That
#     workflow can keep its inline install step. Adding it here would
#     pull in a curl-fetched binary (not in nixpkgs) and complicate the
#     image; defer until it shows up in nixpkgs or we move FlakeHub
#     publishing to a separate flow.
#   * The Attic binary-cache substituter URL + public key. The remote
#     ARC cluster runs an Attic instance for the nix cache, but the
#     URL/key live in grail-config (not in this image). The pod
#     template should inject them via NIX_CONFIG env var or by mounting
#     a ConfigMap over /etc/nix/nix.conf.d/attic.conf — both compose
#     additively with the baked /etc/nix/nix.conf shipped below.
#
# Pod-template note: workflows need /nix/store to be writable at runtime
# (they invoke `nix build` to construct derivations). The image's
# /nix/store is read-only by default. The ARC runner pod template should
# either mount an emptyDir/PVC at /nix and bootstrap from the image's
# baked store on first start, or run with an overlayfs upperdir so the
# baked layers stay read-only while new derivations land in the upper.

let
  version = "2.330.0";

  arch = if pkgs.stdenv.hostPlatform.isAarch64 then "arm64" else "x64";

  hashes = {
    x64 = "sha256-r1wz+pTzzDO46Xk3k5E2prBBl+ba38+ztuM64b9B55o=";
    arm64 = "sha256-nLQ1J5EghsfI+0EZywZAn8vL1vk6LYUH8wsHxJViD1w=";
  };

  actions-runner = pkgs.stdenv.mkDerivation rec {
    pname = "actions-runner";
    inherit version;

    src = pkgs.fetchurl {
      url = "https://github.com/actions/runner/releases/download/v${version}/actions-runner-linux-${arch}-${version}.tar.gz";
      hash = hashes.${arch};
    };

    nativeBuildInputs = [ pkgs.autoPatchelfHook ];

    buildInputs = with pkgs; [
      zlib
      openssl
      icu
      curl
      libkrb5
      stdenv.cc.cc.lib
      lttng-ust
    ];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/runner
      cp -r . $out/runner/
      mkdir -p $out/bin
      ln -s $out/runner/run.sh $out/bin/run.sh
      ln -s $out/runner/config.sh $out/bin/config.sh
      chmod +x $out/runner/run.sh $out/runner/config.sh
      runHook postInstall
    '';

    dontStrip = true;

    meta = with lib; {
      description = "GitHub Actions self-hosted runner";
      homepage = "https://github.com/actions/runner";
      license = licenses.mit;
      platforms = [ "x86_64-linux" "aarch64-linux" ];
    };
  };

  # Pre-baked /etc/nix/nix.conf so workflows don't have to set up flakes
  # / nix-command before every invocation. Anything below this point is
  # readable but not modifiable inside the runner — workflows can layer
  # additional config via $HOME/.config/nix/nix.conf, the NIX_CONFIG env
  # var, or /etc/nix/nix.conf.d/ overlays mounted by the ARC pod template.
  #
  # The Attic substituter belongs in the pod-template overlay so the
  # URL/key can rotate without rebuilding this image. Example overlay:
  #
  #   substituters = https://cache.nixos.org/ https://attic.internal/nix-containers
  #   trusted-public-keys = cache.nixos.org-1:... nix-containers:...
  #
  # set via the NIX_CONFIG env var or a ConfigMap mounted at
  # /etc/nix/nix.conf.d/attic.conf.
  nixConfig = pkgs.writeTextDir "etc/nix/nix.conf" ''
    experimental-features = nix-command flakes
    accept-flake-config = true
    # Pre-populated with cache.nixos.org so any image-build job has a
    # substituter even before the pod-template overlay (with Attic) is
    # applied. Additional substituters from NIX_CONFIG / nix.conf.d are
    # merged in by Nix at runtime.
    substituters = https://cache.nixos.org/
    trusted-public-keys = cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=
    # Trust the daemon process when one is running; harmless in single-user
    # mode. Lets the runner build derivations without prompting.
    trusted-users = root @wheel
    max-jobs = auto
    cores = 0
  '';

in mkImage {
  drv = actions-runner;
  name = "actions-runner";
  tag = "v${version}";
  entrypoint = [ "${actions-runner}/runner/run.sh" ];
  cmd = [];

  extraPkgs = with pkgs; [
    git
    curl
    jq
    nodejs
    docker-client
    # Baked-in Nix: gives workflows `nix`, `nix-build`, `nix-store`, etc.
    # on PATH out of the box. With this present, every workflow can drop
    # its `DeterminateSystems/nix-installer-action` step.
    nix
    # cacert wires up Nix's HTTPS substituter requests against the
    # system trust store — without it, fetchurl into the binary cache
    # silently fails with TLS errors.
    cacert
    # Bash for the workflow shell (the runner picks
    # /nix/var/nix/profiles/default/bin/bash by default).
    bash
    # /etc/nix/nix.conf with flakes + nix-command enabled.
    nixConfig
  ];

  user = "0:0";  # Runs as root by default for docker-in-docker

  env = {
    # Point Nix at the baked cacert bundle so HTTPS calls work the
    # moment a job starts.
    NIX_SSL_CERT_FILE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
    SSL_CERT_FILE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
  };

  labels = {
    "org.opencontainers.image.title" = "GitHub Actions Runner";
    "org.opencontainers.image.description" = "Self-hosted runner for GitHub Actions with Nix pre-installed";
    "org.opencontainers.image.version" = version;
  };
}
