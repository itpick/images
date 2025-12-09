{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for cosign:
# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.cosign  # cosign (3.0.2-r3)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)

let
  cosignPackages = with pkgs; [
    cosign
    bash
    coreutils
    findutils
    which
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "cosign";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "cosign-root";
      paths = base.basePackages ++ cosignPackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath cosignPackages}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Container signing tool with support for OCI registry";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.cosign.version;
      "io.nix-containers.image.upstream" = "https://sigstore.dev/";
      "io.nix-containers.image.category" = "devops-tool";
      "io.nix-containers.image.aliases" = "cosign,signing,security,sigstore";
    };
  };
}