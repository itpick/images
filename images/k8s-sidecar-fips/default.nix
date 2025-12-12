{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# k8s-sidecar-fips
# Container image

let
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "k8s-sidecar-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "k8s-sidecar-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "k8s-sidecar-fips";
      "org.opencontainers.image.description" = "k8s-sidecar-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
