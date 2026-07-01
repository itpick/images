{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/fluxcd/source-watcher

buildGoModule rec {
  pname = "flux-source-watcher";
  version = "2.2.1";

  src = fetchFromGitHub {
    owner = "fluxcd";
    repo = "source-watcher";
    rev = "v${version}";
    hash = "sha256-a9iEzzDjlTg8tM35Cb0MRmaLiD8RRHUSUtguC2Jroyg=";
  };

  vendorHash = "sha256-XdhUgd4Z0RX+HqWGdRBNeXsAprNkbDEqtoldwZ+YZp8=";

  subPackages = [ "cmd" ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
  ];

  doCheck = false;

  postInstall = ''
    mv $out/bin/cmd $out/bin/source-watcher
  '';

  meta = with lib; {
    description = "Flux source watcher - example controller for watching GitRepository and Bucket sources";
    homepage = "https://github.com/fluxcd/source-watcher";
    license = licenses.asl20;
  };
}
