{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# corretto-bcfips-policy-140-3-j21
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
  name = "corretto-bcfips-policy-140-3-j21";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "corretto-bcfips-policy-140-3-j21-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "binary";
      "io.nix-containers.build-method" = "Pre-built binary packaged with Nix";
      "org.opencontainers.image.title" = "corretto ucfips policy 140 3 j21";
      "org.opencontainers.image.description" = "corretto-bcfips-policy-140-3-j21 container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
