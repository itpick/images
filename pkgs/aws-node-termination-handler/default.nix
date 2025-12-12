{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/aws/aws-node-termination-handler

buildGoModule rec {
  pname = "aws-node-termination-handler";
  version = "1.25.3";

  src = fetchFromGitHub {
    owner = "aws";
    repo = "aws-node-termination-handler";
    rev = "v${version}";
    hash = "sha256-oOkWynLQFUwdb6/fPC4d1zPQSwPuu4DN+YoqU6kD9PQ=";
  };

  vendorHash = "sha256-4qlqqdj9OdTA6Afeaf5TcQH9zuzX4L5tnG/4p6iDDlo=";

  subPackages = [ "cmd/node-termination-handler" ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X main.version=${version}"
  ];

  postInstall = ''
    mv $out/bin/node-termination-handler $out/bin/aws-node-termination-handler
  '';

  doCheck = false;

  meta = with lib; {
    description = "Gracefully handle EC2 instance shutdown within Kubernetes";
    homepage = "https://github.com/aws/aws-node-termination-handler";
    license = licenses.asl20;
  };
}
