{ mkImage, fetchFromGitHub, python3Packages, lib, ... }:


# Chainguard SBOM packages for k8s-sidecar:
# Packages available in nixpkgs:
#   pkgs.gdbm  # gdbm (1.26-r1)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libuuid  # libuuid (2.41.2-r2)
#   pkgs.mpdecimal  # mpdecimal (4.0.1-r3)
#   pkgs.ncurses  # ncurses (6.5_p20251025-r1)
#   pkgs.python  # python-3.13 (3.13.11-r0)
#   pkgs.readline  # readline (8.3-r1)
#   pkgs.xz  # xz (5.8.1-r6)
#   pkgs.zlib  # zlib (1.3.1-r51)
# Packages NOT in nixpkgs:
#   k8s-sidecar (2.1.4-r0)
#   ld-linux (2.42-r4)
#   libbz2-1 (1.0.8-r21)
#   libcrypto3 (3.6.0-r4)
#   libexpat1 (2.7.3-r0)
#   libssl3 (3.6.0-r4)
#   libstdc++ (15.2.0-r6)
#   ncurses-terminfo-base (6.5_p20251025-r1)
#   py3-pip-wheel (25.3-r2)
#   python-3.13-base (3.13.11-r0)
#   sqlite-libs (3.51.1-r0)

let
  version = "1.28.0";
  k8s-sidecar = python3Packages.buildPythonApplication {
    pname = "k8s-sidecar";
    inherit version;
    format = "pyproject";

    src = fetchFromGitHub {
      owner = "kiwigrid";
      repo = "k8s-sidecar";
      rev = version;
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    nativeBuildInputs = with python3Packages; [
      setuptools
    ];

    propagatedBuildInputs = with python3Packages; [
      requests
      kubernetes
    ];

    doCheck = false;

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
