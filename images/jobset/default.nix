# jobset
# =============
# Kubernetes JobSet Controller - Manage groups of Jobs as a unit
# https://github.com/kubernetes-sigs/jobset

{ mkImage, fetchFromGitHub, buildGoModule, pkgs, lib, ... }:

# JobSet provides a Kubernetes-native API for managing groups of Jobs
# Used for HPC and AI/ML training workloads

let
  version = "0.10.1";
  jobset-controller = buildGoModule {
    pname = "jobset-controller";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes-sigs";
      repo = "jobset";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build

    subPackages = [ "." ];

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X sigs.k8s.io/jobset/pkg/version.Version=${version}"
    ];

    doCheck = false;

    postInstall = ''
      mv $out/bin/jobset $out/bin/jobset-controller
    '';

    meta = with lib; {
      description = "Kubernetes JobSet Controller for managing groups of Jobs";
      homepage = "https://github.com/kubernetes-sigs/jobset";
      license = licenses.asl20;
    };
  };

in
mkImage {
  drv = jobset-controller;
  name = "jobset";
  tag = "v${version}";
  entrypoint = [ "${jobset-controller}/bin/jobset-controller" ];
  cmd = [];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "JobSet Controller";
    "org.opencontainers.image.description" = "Kubernetes JobSet Controller for HPC and ML workloads";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "jobset";
  };
}
