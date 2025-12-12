{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# envoy-ratelimit
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
  name = "envoy-ratelimit";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "envoy-ratelimit-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "envoy ratelimit";
      "org.opencontainers.image.description" = "envoy-ratelimit container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
