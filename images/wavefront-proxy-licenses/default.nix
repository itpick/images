{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# wavefront-proxy-licenses
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
  name = "wavefront-proxy-licenses";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "wavefront-proxy-licenses-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "wavefront proxy licenses";
      "org.opencontainers.image.description" = "wavefront-proxy-licenses container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
