{ mkImage, fetchFromGitHub, buildGoModule, lib, ... }:


# Chainguard SBOM packages for vault-csi-provider:
# Packages NOT in nixpkgs:
#   vault-csi-provider (1.6.0-r3)

let
  version = "1.4.2";
  vault-csi-provider = buildGoModule {
    pname = "vault-csi-provider";
    inherit version;

    src = fetchFromGitHub {
      owner = "hashicorp";
      repo = "vault-csi-provider";
      rev = "v${version}";
      hash = "sha256-Ejnnp/0KFFkVxfiRu8i7oG/2NqfJRd/6qov4rg8ZNwA=";
    };

    vendorHash = null;  # TODO: Update after first build

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s" "-w"
      "-X github.com/hashicorp/vault-csi-provider/internal/version.Version=${version}"
    ];

    doCheck = false;

    meta = with lib; {
      description = "Vault CSI Provider for Kubernetes Secrets Store CSI driver";
      homepage = "https://github.com/hashicorp/vault-csi-provider";
      license = licenses.mpl20;
    };
  };

in
mkImage {
  drv = vault-csi-provider;
  name = "vault-csi-provider";
  tag = "v${version}";
  entrypoint = [ "${vault-csi-provider}/bin/vault-csi-provider" ];
  cmd = [ "--help" ];
  # Chainguard runs vault-csi-provider as root
  user = "0:0";

  labels = {
    "org.opencontainers.image.title" = "Vault CSI Provider";
    "org.opencontainers.image.description" = "CSI provider for Vault secrets";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "vault";
  };
}
