{ mkImage, pkgs, lib, ... }:


# Chainguard SBOM packages for shellcheck:
# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.gmp  # gmp (6.3.0-r8)
#   pkgs.libffi  # libffi (3.5.2-r1)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
#   pkgs.numactl  # numactl (2.0.19-r2)
#   pkgs.shellcheck  # shellcheck (0.11.0-r1)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)
#   libstdc++ (15.2.0-r6)

mkImage {
  drv = pkgs.shellcheck;
  name = "shellcheck";
  tag = "v${pkgs.shellcheck.version}";
  entrypoint = [ "${pkgs.shellcheck}/bin/shellcheck" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "ShellCheck";
    "org.opencontainers.image.description" = "Static analysis tool for shell scripts";
    "org.opencontainers.image.version" = pkgs.shellcheck.version;
    "io.nix-containers.chart" = "argocd";
  };
}
