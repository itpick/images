{ buildCLIImage, fetchFromGitHub, buildGoModule, lib, ... }:

let
  version = "1.4.2";
  vault-csi-provider = buildGoModule {
    pname = "vault-csi-provider";
    inherit version;

    src = fetchFromGitHub {
      owner = "hashicorp";
      repo = "vault-csi-provider";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Fix hash after first build
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
buildCLIImage {
  drv = vault-csi-provider;
  name = "vault-csi-provider";
  tag = "v${version}";
  entrypoint = [ "${vault-csi-provider}/bin/vault-csi-provider" ];
  cmd = [ "--help" ];

  labels = {
    "org.opencontainers.image.title" = "Vault CSI Provider";
    "org.opencontainers.image.description" = "CSI provider for Vault secrets";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "vault";
  };
}
