{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# azure-workload-identity-webhook
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
  name = "azure-workload-identity-webhook";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "azure-workload-identity-webhook-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "azure workload identity weuhook";
      "org.opencontainers.image.description" = "azure-workload-identity-webhook container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
