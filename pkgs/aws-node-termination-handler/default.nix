{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/aws/aws-node-termination-handler

buildGoModule rec {
  pname = "aws-node-termination-handler";
  version = "1.25.6";

  src = fetchFromGitHub {
    owner = "aws";
    repo = "aws-node-termination-handler";
    rev = "v${version}";
    hash = "sha256-QKLxJ5gt6yStMsw6tr+MrGNZX014PGCDPSQ7wgAwFEw=";
  };

  vendorHash = "sha256-PR0HZtsTlDYUtp0BsJrwmQ0U0gc6YT6ZtepL4G0DQ9M=";

  subPackages = [ "cmd" ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X main.version=${version}"
  ];

  postInstall = ''
    mv $out/bin/cmd $out/bin/aws-node-termination-handler
  '';

  doCheck = false;

  meta = with lib; {
    description = "Gracefully handle EC2 instance shutdown within Kubernetes";
    homepage = "https://github.com/aws/aws-node-termination-handler";
    license = licenses.asl20;
  };
}
