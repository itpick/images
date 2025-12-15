{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# cyberark-secrets-provider-for-k8s
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
  name = "cyberark-secrets-provider-for-k8s";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "cyberark-secrets-provider-for-k8s-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "cyuerark secrets provider for k8s";
      "org.opencontainers.image.description" = "cyberark-secrets-provider-for-k8s container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
