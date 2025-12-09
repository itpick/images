{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

# Keycloak - Open Source Identity and Access Management
# https://github.com/keycloak/keycloak

let
  keycloakPackages = with pkgs; [
    keycloak
    bash
    busybox
    openjdk21
    cacert
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "keycloak";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "keycloak-root";
      paths = base.basePackages ++ keycloakPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath keycloakPackages}"
      "KC_HOME=${pkgs.keycloak}"
      "JAVA_HOME=${pkgs.openjdk21}"
    ];
    ExposedPorts = {
      "8080/tcp" = {};
      "8443/tcp" = {};
    };
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Keycloak Identity and Access Management";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.keycloak.version;
      "io.nix-containers.image.upstream" = "https://www.keycloak.org/";
      "io.nix-containers.image.category" = "identity";
      "io.nix-containers.image.aliases" = "keycloak,iam,sso,oauth";
    };
  };
}
