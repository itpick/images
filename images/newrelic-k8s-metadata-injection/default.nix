{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# newrelic-k8s-metadata-injection
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
  name = "newrelic-k8s-metadata-injection";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "newrelic-k8s-metadata-injection-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "newrelic k8s metadata injection";
      "org.opencontainers.image.description" = "newrelic-k8s-metadata-injection container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
