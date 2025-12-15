{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:

let
  # Attic packages (Chainguard doesn't have an SBOM for attic, using sensible defaults)
  atticPackages = with pkgs; [
    attic-client
    bash
    coreutils
    cacert
  ];

  # Use default non-root user environment
  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "attic";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "attic-root";
      paths = base.basePackages ++ atticPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath atticPackages}"
    ];
    Labels = base.defaultLabels // {
      "io.nix-containers.build-type" = "source";
      "io.nix-containers.build-method" = "Built from source using Nix";
      "org.opencontainers.image.description" = "Attic client for multi-tenant Nix binary cache with S3 storage";
      "org.opencontainers.image.version" = pkgs.attic-client.version;
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "io.nix-containers.image.upstream" = "https://github.com/zhaofengli/attic";
      "io.nix-containers.image.category" = "devops-tool";
      "io.nix-containers.image.aliases" = "attic,nix-cache,binary-cache";
    };
  };
}
