{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# openldap-2.6-clients
# OpenLDAP component

let
  ldapPkgs = with pkgs; [
    openldap
    bash
    coreutils
    cacert
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "openldap-2.6-clients";
  tag = pkgs.openldap.version;

  copyToRoot = [
    (buildEnv {
      name = "openldap-2.6-clients-root";
      paths = base.basePackages ++ ldapPkgs ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv;
    Labels = base.defaultLabels // {
      "org.opencontainers.image.title" = "openldap 2.6 clients";
      "org.opencontainers.image.description" = "OpenLDAP openldap-2.6-clients";
      "org.opencontainers.image.version" = pkgs.openldap.version;
    };
  };
}
