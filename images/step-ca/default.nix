{ mkImage, pkgs, lib, ... }:

# Chainguard SBOM packages for step-ca:
# Packages available in nixpkgs:
#   pkgs.step-ca  # Private certificate authority (X.509 & SSH) & ACME server

let
  # nixpkgs step-ca 0.29.0 bundles a jackc/pgx with a critical CVE; 0.30.2
  # pulls a patched pgx (v5.8.0).
  stepca = pkgs.step-ca.overrideAttrs (o: rec {
    version = "0.30.2";
    src = pkgs.fetchFromGitHub {
      owner = "smallstep";
      repo = "certificates";
      rev = "v${version}";
      hash = "sha256-Cxr2DMF415iERdAltd2FvX+C5qJmVW5Npu2JbMC4k8o=";
    };
    vendorHash = "sha256-FBkQXKNtstQ+F7jvKUj6oCbsri+SjGKy0tG59TtUHPQ=";
  });
in
mkImage {
  drv = stepca;
  name = "step-ca";
  tag = "v${stepca.version}";
  entrypoint = [ "${stepca}/bin/step-ca" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "step-ca";
    "org.opencontainers.image.description" = "Private certificate authority & ACME server for secure automated certificate management";
    "org.opencontainers.image.version" = stepca.version;
    "io.nix-containers.chart" = "step-certificates";
  };
}
