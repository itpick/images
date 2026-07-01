{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/argoproj/argo-events

buildGoModule rec {
  pname = "argo-events";
  version = "1.9.10";

  src = fetchFromGitHub {
    owner = "argoproj";
    repo = "argo-events";
    rev = "v${version}";
    hash = "sha256-C0FDilzSjY7OMtqQV/mudT+Ojg4+w2FL6IKVgs0dNQ4=";
  };

  vendorHash = "sha256-XeA2SwqS8qZVWisXhGAGE+kFH/tyRdb29L+3sPfLIZU=";

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
