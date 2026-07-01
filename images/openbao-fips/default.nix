{ mkImage, pkgs, lib, ... }:

# openbao-fips
# Container image packaging nixpkgs.openbao
mkImage {
  drv = pkgs.openbao;
  name = "openbao-fips";
  tag = "v${pkgs.openbao.version}";
  entrypoint = [ (lib.getExe pkgs.openbao) ];
  # Was `--help` (a one-shot, so the kind-test pod CrashLoops). Run OpenBao in
  # dev mode — an in-memory, auto-unsealed server. Same package (pkgs.openbao)
  # as the sibling `openbao` image, so use its validated cmd:
  # -dev-listen-address binds 0.0.0.0:8200 for the probe, and -dev-no-store-token
  # stops dev init writing the root token to $HOME/.vault-token (the nonroot
  # pod's HOME "/" is read-only — otherwise it FATALs with permission denied).
  # Operators override with `server -config=/openbao/config.hcl`.
  cmd = [ "server" "-dev" "-dev-no-store-token" "-dev-listen-address=0.0.0.0:8200" ];

  labels = {
    "org.opencontainers.image.title" = "openbao-fips";
    "org.opencontainers.image.description" = "openbao-fips container image (nixpkgs.openbao)";
    "org.opencontainers.image.version" = pkgs.openbao.version;
    "io.nix-containers.source" = "nixpkgs";
  };
}
