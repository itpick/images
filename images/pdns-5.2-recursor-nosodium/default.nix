{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# pdns-5.2-recursor-nosodium
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
  name = "pdns-5.2-recursor-nosodium";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "pdns-5.2-recursor-nosodium-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "pdns 5.2 recursor nosodium";
      "org.opencontainers.image.description" = "pdns-5.2-recursor-nosodium container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
