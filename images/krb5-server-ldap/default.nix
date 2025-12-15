{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# krb5-server-ldap
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
  name = "krb5-server-ldap";
  tag = version;
  copyToRoot = [
    (buildEnv {
      name = "krb5-server-ldap-root";
      paths = base.basePackages ++ imagePkgs ++ [ userEnv ];
    })
  ];
  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.title" = "kru5 server ldap";
      "org.opencontainers.image.description" = "krb5-server-ldap container image";
      "org.opencontainers.image.version" = version;
    };
  };
}
