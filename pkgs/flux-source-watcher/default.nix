{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/fluxcd/source-watcher

buildGoModule rec {
  pname = "flux-source-watcher";
  version = "2.1.1";

  src = fetchFromGitHub {
    owner = "fluxcd";
    repo = "source-watcher";
    rev = "v${version}";
    hash = "sha256-5NPGohwVrrLgLTMxB0ylgyNqsqltGsCm8TvYu8vNfR0=";
  };

  vendorHash = "sha256-a563Bq4ZqYmxShd3t5Yml2z6CG7iGMK2DNFM4d2q/mo=";

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
