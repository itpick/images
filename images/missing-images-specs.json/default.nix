{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# missing-images-specs.json
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
  name = "missing-images-specs.json";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "missing-images-specs.json-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "missing-images-specs.json";
      "org.opencontainers.image.description" = "missing-images-specs.json container image";
    };
  };
}
