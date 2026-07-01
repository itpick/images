{ mkImage, pkgs, lib, fetchFromGitHub, buildGoModule, ... }:

# Argo CD Image Updater (FIPS) - Automatic container image update for Argo CD
# https://github.com/argoproj-labs/argocd-image-updater
# FIPS-compliant build for FedRAMP compliance

let
  version = "1.2.2";

  argocd-image-updater-fips = buildGoModule rec {
    pname = "argocd-image-updater-fips";
    inherit version;

    src = fetchFromGitHub {
      owner = "argoproj-labs";
      repo = "argocd-image-updater";
      rev = "v${version}";
      hash = "sha256-fncxBIRDPwxbtRIxp4Ql+55Ez1jjKZBmC6ClZ2OlQhI=";
    };

    vendorHash = "sha256-8r+XThKzH5619Su+sxK83CF8XuSFGtLXMKZOHgWQR7c=";

    subPackages = [ "cmd" ];

    # Enable FIPS-compliant crypto using Go's boringcrypto experiment
    # This uses Google's BoringSSL (FIPS 140-2 validated) instead of standard crypto
    env.CGO_ENABLED = 1;
    env.GOEXPERIMENT = "boringcrypto";

    ldflags = [
      "-s" "-w"
      "-X github.com/argoproj-labs/argocd-image-updater/pkg/version.version=${version}"
      "-X github.com/argoproj-labs/argocd-image-updater/pkg/version.gitCommit=unknown"
    ];

    postInstall = ''
      mv $out/bin/cmd $out/bin/argocd-image-updater
    '';

    doCheck = false;

    # Build with CGO for BoringCrypto support
    nativeBuildInputs = with pkgs; [ go ];

    meta = with lib; {
      description = "Automatic container image updater for Argo CD (FIPS) with FIPS-validated cryptography";
      homepage = "https://github.com/argoproj-labs/argocd-image-updater";
      license = licenses.asl20;
      platforms = platforms.linux;
    };
  };

in
mkImage {
  drv = argocd-image-updater-fips;
  name = "argocd-image-updater-fips";
  tag = "v${version}";
  entrypoint = [ "${argocd-image-updater-fips}/bin/argocd-image-updater" ];
  cmd = [ "run" ];

  extraPkgs = with pkgs; [ cacert git ];

  labels = {
    "org.opencontainers.image.title" = "Argo CD Image Updater (FIPS)";
    "org.opencontainers.image.description" = "FIPS-compliant automatic container image update for Argo CD";
    "org.opencontainers.image.version" = version;
    "io.nix-containers.chart" = "argocd-image-updater";
    "io.nix-containers.compliance" = "FIPS-140-2";
  };
}
