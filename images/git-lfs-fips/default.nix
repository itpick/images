{ mkImage, pkgs, lib, fetchFromGitHub, buildGoModule, ... }:

# git-lfs-fips - Git Large File Storage with FIPS-compliant cryptography
# https://github.com/git-lfs/git-lfs
# FIPS-compliant build using BoringCrypto

let
  version = "3.7.1";

  git-lfs-fips = buildGoModule rec {
    pname = "git-lfs-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "git-lfs";
      repo = "git-lfs";
      rev = "v${version}";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";  # TODO: Update with actual hash
    };

    vendorHash = null;  # Uses vendor directory - update if needed

    subPackages = [ "." ];

    # Enable FIPS-compliant crypto using Go's boringcrypto experiment
    # This uses Google's BoringSSL (FIPS 140-2 validated) instead of standard crypto
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [
      "-s" "-w"
      "-X github.com/git-lfs/git-lfs/v3/config.Version=${version}"
    ];

    doCheck = false;

    # Build with CGO for BoringCrypto support
    nativeBuildInputs = with pkgs; [ go ];

    meta = with lib; {
      description = "Git Large File Storage with FIPS-compliant cryptography";
      homepage = "https://github.com/git-lfs/git-lfs";
      license = licenses.mit;
      platforms = platforms.linux;
      mainProgram = "git-lfs";
    };
  };

in
mkImage {
  drv = git-lfs-fips;
  name = "git-lfs-fips";
  tag = "v${version}";
  entrypoint = [ "${git-lfs-fips}/bin/git-lfs" ];
  cmd = [ "version" ];

  extraPkgs = with pkgs; [
    cacert
    git
  ];

  labels = {
    "org.opencontainers.image.title" = "git-lfs-fips";
    "org.opencontainers.image.description" = "Git Large File Storage with FIPS-compliant cryptography";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.compliance" = "FIPS-140-2";
    "io.nix-containers.chart" = "git-lfs-fips";
  };
}
