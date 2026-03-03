{ mkImage, fetchFromGitHub, python3, pkgs, lib, ... }:

let
  version = "1.28.0";

  python = python3.withPackages (ps: with ps; [
    kubernetes
    requests
  ]);

  k8s-sidecar = pkgs.stdenv.mkDerivation {
    pname = "k8s-sidecar";
    inherit version;

    src = fetchFromGitHub {
      owner = "kiwigrid";
      repo = "k8s-sidecar";
      rev = version;
      hash = "sha256-Zopfn8oujeru7LtsD4ISImIiGmptWs0WNhor/0Y5NoU=";
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
