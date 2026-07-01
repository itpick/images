{ mkImage, pkgs, lib, fetchFromGitHub, buildGoModule, ... }:

# git-sync-fips - Sidecar to synchronize a git repository with FIPS-compliant cryptography
# https://github.com/kubernetes/git-sync
# FIPS-compliant build using BoringCrypto

let
  version = "4.5.0";

  git-sync-fips = buildGoModule rec {
    pname = "git-sync-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "kubernetes";
      repo = "git-sync";
      rev = "v${version}";
      hash = "sha256-kOIO/F8hud6PUqB5v6ZKTYdnh3PnEK1h4k0kNoHPO6E=";  # TODO: Update with actual hash
    };

    vendorHash = null;  # Uses vendor directory - update if needed

    subPackages = [ "." ];

    # Enable FIPS-compliant crypto using Go's boringcrypto experiment
    # This uses Google's BoringSSL (FIPS 140-2 validated) instead of standard crypto
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [
      "-s" "-w"
      "-X main.version=${version}"
    ];

    doCheck = false;

    # Build with CGO for BoringCrypto support
    nativeBuildInputs = with pkgs; [ go ];

    meta = with lib; {
      description = "Sidecar to continuously synchronize a git repository with FIPS-compliant cryptography";
      homepage = "https://github.com/kubernetes/git-sync";
      license = licenses.asl20;
      platforms = platforms.linux;
      mainProgram = "git-sync";
    };
  };

in
mkImage {
  drv = git-sync-fips;
  name = "git-sync-fips";
  tag = "v${version}";
  entrypoint = [ "${git-sync-fips}/bin/git-sync" ];
  cmd = [ "--help" ];

  extraPkgs = with pkgs; [
    cacert
    git
    openssh
  ];

  labels = {
    "org.opencontainers.image.title" = "git-sync-fips";
    "org.opencontainers.image.description" = "Sidecar to continuously synchronize a git repository with FIPS-compliant cryptography";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    "io.nix-containers.chart" = "git-sync-fips";
  };
}
