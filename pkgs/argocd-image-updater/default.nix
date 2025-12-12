{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/argoproj-labs/argocd-image-updater

buildGoModule rec {
  pname = "argocd-image-updater";
  version = "1.0.1";

  src = fetchFromGitHub {
    owner = "argoproj-labs";
    repo = "argocd-image-updater";
    rev = "v${version}";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

  subPackages = [ "cmd" ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/argoproj-labs/argocd-image-updater/pkg/version.version=${version}"
    "-X github.com/argoproj-labs/argocd-image-updater/pkg/version.gitCommit=unknown"
  ];

  postInstall = ''
    mv $out/bin/cmd $out/bin/argocd-image-updater
  '';

  doCheck = false;

  meta = with lib; {
    description = "Automatic container image updater for Argo CD";
    homepage = "https://github.com/argoproj-labs/argocd-image-updater";
    license = licenses.asl20;
  };
}
