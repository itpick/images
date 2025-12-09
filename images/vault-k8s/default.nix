{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:


# Chainguard SBOM packages for vault-k8s:
# Packages available in nixpkgs:
#   pkgs.glibc  # glibc (2.42-r4)
#   pkgs.libcap  # libcap (2.77-r0)
#   pkgs.libgcc  # libgcc (15.2.0-r6)
# Packages NOT in nixpkgs:
#   ld-linux (2.42-r4)
#   vault-k8s (1.7.1-r1)

let
  version = "1.4.1";
  vault-k8s = buildGoModule {
    pname = "vault-k8s";
    inherit version;

    src = fetchFromGitHub {
      owner = "hashicorp";
      repo = "vault-k8s";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
    };

    vendorHash = null;  # TODO: Update after first build

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/hashicorp/vault-k8s/version.Version=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Vault Agent Injector for Kubernetes";
      homepage = "https://github.com/hashicorp/vault-k8s";
      license = licenses.mpl20;
    };
  };

in
mkImage {
  drv = vault-k8s;
  name = "vault-k8s";
  tag = "v${version}";
  entrypoint = [ "${vault-k8s}/bin/vault-k8s" ];
  cmd = [ "--help" ];

  extraPkgs = [ libcap ];

  labels = {
    "org.opencontainers.image.title" = "Vault Agent Injector";
    "org.opencontainers.image.description" = "Vault Agent Injector for Kubernetes";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "vault";
  };
}
