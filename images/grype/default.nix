{ nix2container, lib, buildEnv, pkgs, base, nonRoot, ... }:


# Chainguard SBOM packages for grype:
# Packages available in nixpkgs:
#   pkgs.busybox  # busybox (1.37.0-r50)
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.grype  # grype (0.104.1-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.libxcrypt  # libxcrypt (4.5.2-r0)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)
#   libcrypt1 (2.42-r4)

let
  grypePackages = with pkgs; [
    grype
    bash
    coreutils
    findutils
    which
  ];

  userEnv = nonRoot.mkDefaultUserEnv pkgs [];

in
nix2container.buildImage {
  name = "grype";
  tag = "latest";

  copyToRoot = [
    (buildEnv {
      name = "grype-root";
      paths = base.basePackages ++ grypePackages ++ [ userEnv ];
    })
  ];

  config = nonRoot.defaultConfig // {
    Env = base.defaultEnv ++ nonRoot.userEnv ++ [
      "PATH=${lib.makeBinPath grypePackages}"
    ];
    Labels = base.defaultLabels // {
      "org.opencontainers.image.description" = "Vulnerability scanner for container images and filesystems";
      "org.opencontainers.image.url" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.source" = "https://github.com/nix-containers/images";
      "org.opencontainers.image.vendor" = "nix-containers";
      "org.opencontainers.image.version" = pkgs.grype.version;
      "io.nix-containers.image.upstream" = "https://github.com/anchore/grype";
      "io.nix-containers.image.category" = "devops-tool";
      "io.nix-containers.image.aliases" = "grype,vulnerability,scanner,security";
    };
  };
}