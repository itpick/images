{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# k8s-metadata-injection-fips
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
  name = "k8s-metadata-injection-fips";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "k8s-metadata-injection-fips-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "k8s-metadata-injection-fips";
      "org.opencontainers.image.description" = "k8s-metadata-injection-fips container image";
    "io.nix-containers.compliance" = "FIPS-140-2";
    };
  };
}
