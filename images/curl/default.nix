{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  # curl packages
  curlPackages = with pkgs; [
    curl
    bash
    coreutils
  ];

  # Use default non-root user environment
  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "curl";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "curl-root";
      paths = base.basePackages ++ curlPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath curlPackages}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Command-line tool for transferring data with URLs";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.curl.version;
      "io.nix-containers.image.upstream" = "https://curl.se/";
      "io.nix-containers.image.category" = "utility";
      "io.nix-containers.image.aliases" = "curl,http-client";
    };
  };
}
