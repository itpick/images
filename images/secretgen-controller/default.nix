{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# secretgen-controller
# Container image

let
  version = "latest";
  
  imagePkgs = with pkgs; [
    bash
    coreutils
    cacert
    tzdata
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in nix2container.buildImage {
  name = "secretgen-controller";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "secretgen-controller-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "secretgen controller";
      "org.opencontainers.image.description" = "secretgen-controller container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
