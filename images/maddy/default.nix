{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  # maddy packages
  maddyPackages = with pkgs; [
    maddy
    bash
    coreutils
  ];

  # Use default non-root user environment
  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "maddy";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "maddy-root";
      paths = base.basePackages ++ maddyPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath maddyPackages}"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "Composable all-in-one mail server with SMTP and IMAP";
      "org.opencontainers.image.version" = "0.7.0";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "io.nix-containers.image.upstream" = "https://maddy.email/";
      "io.nix-containers.image.category" = "web-service";
      "io.nix-containers.image.aliases" = "maddy,mail-server,smtp,imap";
    };
  };
}
