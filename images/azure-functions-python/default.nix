{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# azure-functions-python
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
  name = "azure-functions-python";
  tag = "latest";
  copyToRoot = [
    (buildEnv {
      name = "azure-functions-python-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "azure-functions-python";
      "org.opencontainers.image.description" = "azure-functions-python container image";
    };
  };
}
