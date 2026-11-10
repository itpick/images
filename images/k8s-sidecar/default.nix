{ mkImage, fetchFromGitHub, fetchPypi, python3, pkgs, lib, ... }:

let
  version = "2.14.3";

  # logfmter isn't in nixpkgs as of nixos-25.11; package it inline from
  # PyPI. Pure-Python, no native deps — buildPythonPackage suffices.
  # Pinned to the version k8s-sidecar 2.7.3's pyproject.toml requires.
  logfmter = pythonPatched.pkgs.buildPythonPackage rec {
    pname = "logfmter";
    version = "0.0.12";
    pyproject = true;
    src = fetchPypi {
      inherit pname version;
      hash = "sha256-lY0OG+IVYhRRhF+V+OMmYNjadgpLzY7MVWSgx5Vwxnk=";
    };
    build-system = [ pythonPatched.pkgs.setuptools ];
    doCheck = false;
    meta.license = lib.licenses.mit;
  };

  # CVE: nixpkgs lags on these three (oauthlib GHSA-3jp2-3mrg-2vxc,
  # pyasn1 GHSA-2qm8-x737-gmw5 et al., urllib3 GHSA-8988-9cw3-xx77).
  # Drop each override once nixpkgs reaches the version pinned here.
  pythonPatched = python3.override {
    self = pythonPatched;
    packageOverrides = pyFinal: pyPrev: {
      # Rebuilt only because urllib3 changed; its test suite is flaky in the
      # build sandbox (signal handling) and it is not in the runtime closure.
      uvloop = pyPrev.uvloop.overridePythonAttrs { doCheck = false; };
      oauthlib = pyPrev.oauthlib.overridePythonAttrs (o: rec {
        version = "4.0.1";
        src = fetchFromGitHub {
          owner = "oauthlib"; repo = "oauthlib"; tag = "v${version}";
          hash = "sha256-0Me+Szy6US7+TV3A22Yb8hhJzMQhv7ZSUEHhDVI0FHw=";
        };
        doCheck = false;
      });
      pyasn1 = pyPrev.pyasn1.overridePythonAttrs (o: rec {
        version = "0.6.5";
        src = fetchPypi {
          pname = "pyasn1"; inherit version;
          hash = "sha256-axFhamvPOkDmNfCCuyMvpXteDdf1F7193WnsN5RQikc=";
        };
        doCheck = false;
      });
      urllib3 = pyPrev.urllib3.overridePythonAttrs (o: rec {
        version = "2.8.0";
        src = fetchPypi {
          pname = "urllib3"; inherit version;
          hash = "sha256-Y78urUyHlCbr8i7yp4HutKo7SueYoENVBvhof9W7m2M=";
        };
        doCheck = false;
      });
    };
  };

  python = pythonPatched.withPackages (ps: with ps; [
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
      hash = "sha256-7fbbl+WCe1/6NVaIzDVIwVHEe37usS/JZVmYkbfHDwc=";
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
