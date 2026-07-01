{ lib, fetchFromGitHub, buildGoModule }:

# Built from wolfi-dev/os cloudnative-pg.yaml
# https://github.com/cloudnative-pg/cloudnative-pg

buildGoModule rec {
  pname = "cloudnative-pg";
  version = "1.30.0";

  src = fetchFromGitHub {
    owner = "cloudnative-pg";
    repo = "cloudnative-pg";
    rev = "v${version}";
    hash = "sha256-UHgllbD2eNBVYrF5nPZhethZIyyBkEji1xf0okGshoI=";
  };

  vendorHash = "sha256-Eh057tW8NTCNVtgyeY4A+Cc8wQbRDpUYDFmj4l+pn8o=";

  subPackages = [ "cmd/manager" ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/cloudnative-pg/cloudnative-pg/pkg/versions.buildVersion=${version}"
    "-X github.com/cloudnative-pg/cloudnative-pg/pkg/versions.buildCommit=a4060c15"
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
