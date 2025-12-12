{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# datawire-envoy-1.31-privileged
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
  name = "datawire-envoy-1.31-privileged";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "datawire-envoy-1.31-privileged-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "datawire envoy 1.31 privileged";
      "org.opencontainers.image.description" = "datawire-envoy-1.31-privileged container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
