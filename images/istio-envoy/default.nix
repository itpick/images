{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# istio-envoy
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
  name = "istio-envoy";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "istio-envoy-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "istio envoy";
      "org.opencontainers.image.description" = "istio-envoy container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
