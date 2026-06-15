{ mkImage, fetchFromGitHub, fetchPypi, python3, pkgs, lib, ... }:

let
  version = "2.7.3";

  # logfmter isn't in nixpkgs as of nixos-25.11; package it inline from
  # PyPI. Pure-Python, no native deps — buildPythonPackage suffices.
  # Pinned to the version k8s-sidecar 2.7.3's pyproject.toml requires.
  logfmter = python3.pkgs.buildPythonPackage rec {
    pname = "logfmter";
    version = "0.0.12";
    pyproject = true;
    src = fetchPypi {
      inherit pname version;
      hash = "sha256-lY0OG+IVYhRRhF+V+OMmYNjadgpLzY7MVWSgx5Vwxnk=";
    };
    build-system = [ python3.pkgs.setuptools ];
    doCheck = false;
    meta.license = lib.licenses.mit;
  };

  python = python3.withPackages (ps: with ps; [
    kubernetes
    requests
    # New deps for k8s-sidecar 2.7.x — missed when image was first
    # packaged, surfaced as `ModuleNotFoundError: No module named
    # 'logfmter'` at startup when run as the grafana sidecar.
    python-json-logger
    logfmter
  ]);

  k8s-sidecar = pkgs.stdenv.mkDerivation {
    pname = "k8s-sidecar";
    inherit version;

    src = fetchFromGitHub {
      owner = "kiwigrid";
      repo = "k8s-sidecar";
      rev = version;
      hash = "sha256-ZmDVqniiHWughAGShTMSH+VNn7fkdZLenRL3BTI3Fks=";
    };

    dontBuild = true;

    installPhase = ''
      mkdir -p $out/lib/k8s-sidecar $out/bin
      cp src/*.py $out/lib/k8s-sidecar/

      cat > $out/bin/sidecar <<EOF
      #!${python}/bin/python3
      import sys, os
      sys.path.insert(0, "$out/lib/k8s-sidecar")
      exec(open("$out/lib/k8s-sidecar/sidecar.py").read())
      EOF
      chmod +x $out/bin/sidecar
    '';

    meta = with lib; {
      description = "Kubernetes sidecar to collect ConfigMaps and Secrets";
      homepage = "https://github.com/kiwigrid/k8s-sidecar";
      license = licenses.mit;
    };
  };

in
mkImage {
  drv = k8s-sidecar;
  name = "k8s-sidecar";
  tag = "v${version}";
  entrypoint = [ "${k8s-sidecar}/bin/sidecar" ];
  cmd = [];

  labels = {
    "org.opencontainers.image.title" = "K8s Sidecar";
    "org.opencontainers.image.description" = "Kubernetes sidecar to collect ConfigMaps and Secrets";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "kube-prometheus-stack";
  };
}
