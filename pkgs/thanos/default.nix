{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/thanos-io/thanos

buildGoModule rec {
  pname = "thanos";
  version = "0.42.5";

  src = fetchFromGitHub {
    owner = "thanos-io";
    repo = "thanos";
    rev = "v${version}";
    hash = "sha256-akhOvV7qU0OKSouks9soSpusn4BEKhGlGh7LFTwGxOU=";
  };

  vendorHash = "sha256-I99bEflBUrudb+e5A4oBQH9SktJnM96+gUaDs7yPTCM=";

  subPackages = [ "cmd/thanos" ];

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X github.com/prometheus/common/version.Version=${version}"
    "-X github.com/prometheus/common/version.Branch=main"
    "-X github.com/prometheus/common/version.BuildUser=nix"
    "-X github.com/prometheus/common/version.BuildDate=1970-01-01T00:00:00Z"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Highly available Prometheus setup with long term storage capabilities";
    homepage = "https://thanos.io/";
    license = licenses.asl20;
  };
}
