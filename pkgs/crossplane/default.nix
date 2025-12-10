{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "crossplane";
  version = "2.1.3";

  src = fetchFromGitHub {
    owner = "crossplane";
    repo = "crossplane";
    rev = "v${version}";
    hash = "sha256-ODqNay4wmbo770ZBpGSH/Zm2Y2vVmUC6PfTzv9CyZns=";
  };

  vendorHash = "sha256-90TwfDBb5COEGqjDIoUrZVWS/N8A14ZxbrvvFVgMTNU=";

  subPackages = [ "cmd/crossplane" ];

  env.CGO_ENABLED = "0";

  ldflags = [
    "-s"
    "-w"
    "-X github.com/crossplane/crossplane/v2/internal/version.version=v${version}"
  ];

  # Include the cluster directory required by crossplane init
  # crossplane core init expects /crds and /webhookconfigurations at root
  postInstall = ''
    mkdir -p $out/crds $out/webhookconfigurations
    cp -r $src/cluster/crds/* $out/crds/
    cp -r $src/cluster/webhookconfigurations/* $out/webhookconfigurations/
  '';

  meta = with lib; {
    description = "Cloud Native Control Plane";
    homepage = "https://crossplane.io/";
    license = licenses.asl20;
    mainProgram = "crossplane";
  };
}
