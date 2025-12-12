{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# vault-secrets-operator
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
  name = "vault-secrets-operator";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "vault-secrets-operator-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "vault secrets operator";
      "org.opencontainers.image.description" = "vault-secrets-operator container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
