{ mkImage, pkgs, lib, ... }:

# step-ca-fips - naming variant of step-ca (no FIPS claim).
# Container image packaging step-ca.
#
# nixpkgs step-ca 0.29.0 bundles a jackc/pgx v5.6.0 with 8 critical CVEs.
# Override to 0.30.2 which ships patched pgx v5.8.0 — matches the same
# override step-ca/default.nix applies.

let
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
  name = "step-ca-fips";
  tag = "v${stepca.version}";
  entrypoint = [ "${stepca}/bin/step-ca" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [ cacert ];

  labels = {
    "org.opencontainers.image.title" = "step-ca-fips";
    "org.opencontainers.image.description" = "step-ca-fips container image (step-ca 0.30.2)";
    "org.opencontainers.image.version" = stepca.version;
    "io.nix-containers.source" = "nixpkgs+override";
  };
}
