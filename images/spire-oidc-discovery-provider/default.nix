{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# spire-oidc-discovery-provider
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
  name = "spire-oidc-discovery-provider";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "spire-oidc-discovery-provider-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "spire oidc discovery provider";
      "org.opencontainers.image.description" = "spire-oidc-discovery-provider container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
