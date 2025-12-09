{ lib, fetchFromGitHub, buildGoModule }:

# Built from wolfi-dev/os cloudnative-pg.yaml
# https://github.com/cloudnative-pg/cloudnative-pg

buildGoModule rec {
  pname = "cloudnative-pg";
  version = "1.27.1";

  src = fetchFromGitHub {
    owner = "cloudnative-pg";
    repo = "cloudnative-pg";
    rev = "v${version}";
    hash = "sha256-iEia3g3nxnVm4q5lpV9SFOSKgHJsZ7jdqE73vA2bPpI=";
  };

  vendorHash = "sha256-nbUaSTmhAViwkguMsgIp3lh2JVe7ZTwBTM7oE1aIulk=";

  subPackages = [ "cmd/manager" ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/cloudnative-pg/cloudnative-pg/pkg/versions.buildVersion=${version}"
    "-X github.com/cloudnative-pg/cloudnative-pg/pkg/versions.buildCommit=9daa6813"
  ];

  # Rename the output binary to include architecture suffix
  postInstall = ''
    mv $out/bin/manager $out/bin/manager_$(go env GOARCH || echo "amd64")
    ln -s $out/bin/manager_* $out/bin/manager
  '';

  doCheck = false;

  meta = with lib; {
    description = "CloudNativePG is a comprehensive platform designed to manage PostgreSQL databases within Kubernetes";
    homepage = "https://github.com/cloudnative-pg/cloudnative-pg";
    license = licenses.asl20;
  };
}
