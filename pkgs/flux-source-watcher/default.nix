{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/fluxcd/source-watcher

buildGoModule rec {
  pname = "flux-source-watcher";
  version = "2.0.3";

  src = fetchFromGitHub {
    owner = "fluxcd";
    repo = "source-watcher";
    rev = "v${version}";
    hash = "sha256-TVTs60WX0/X4LBWe2hszlmXC8rp8CwC3mW5AXR8H1Rs=";
  };

  vendorHash = "sha256-1o5JZsPc23XEugwWB4nPvZiLeZLzu26wBivLTmEH2J8=";

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
