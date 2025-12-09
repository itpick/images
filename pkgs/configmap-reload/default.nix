{ lib, fetchFromGitHub, buildGoModule }:

# Built from wolfi-dev/os configmap-reload.yaml
# https://github.com/jimmidyson/configmap-reload

buildGoModule rec {
  pname = "configmap-reload";
  version = "0.15.0";

  src = fetchFromGitHub {
    owner = "jimmidyson";
    repo = "configmap-reload";
    rev = "v${version}";
    hash = "sha256-U6ua86cZbb/omIz3IP/nW1wBc6oQdW7MgAEA9geKbZw=";
  };

  vendorHash = "sha256-a65CdGf9j0n6IO8hVKDfTnaNJhzXdsYJ68W3aKLonTc=";

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-extldflags '-static'"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Simple binary to trigger a reload when a Kubernetes ConfigMap is updated";
    homepage = "https://github.com/jimmidyson/configmap-reload";
    license = licenses.asl20;
  };
}
