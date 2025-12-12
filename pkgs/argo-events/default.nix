{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/argoproj/argo-events

buildGoModule rec {
  pname = "argo-events";
  version = "1.9.9";

  src = fetchFromGitHub {
    owner = "argoproj";
    repo = "argo-events";
    rev = "v${version}";
    hash = "sha256-MmXtBez8OrSAIa5v4sYXJYN3retI4HxXiHrPA8j2u3Y=";
  };

  vendorHash = "sha256-7RAjNWCYN7LCK85yWx26rlBhkATExZQBoluVCgvmrM0=";

  subPackages = [ "cmd" ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/argoproj/argo-events.version=${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Event-driven workflow automation framework for Kubernetes";
    homepage = "https://argoproj.github.io/argo-events/";
    license = licenses.asl20;
  };
}
