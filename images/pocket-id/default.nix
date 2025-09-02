{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  # pocket-id packages
  pocket_idPackages = with pkgs; [
    pocket-id
    bash
    coreutils
  ];

  # Use default non-root user environment
  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "pocket-id";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "pocket-id-root";
      paths = base.basePackages ++ pocket_idPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath pocket_idPackages}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Lightweight self-hosted identity provider with OAuth2 and OpenID Connect";
      "org.opencontainers.image.version" = "1.0.0";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "io.nix-containers.image.upstream" = "https://github.com/pocket-id/pocket-id";
      "io.nix-containers.image.category" = "web-service";
      "io.nix-containers.image.aliases" = "pocket-id,oauth2,oidc,identity";
    };
  };
}
