{ lib, fetchFromGitHub, buildGoModule }:

# https://github.com/oauth2-proxy/oauth2-proxy

buildGoModule rec {
  pname = "oauth2-proxy";
  version = "7.13.0";

  src = fetchFromGitHub {
    owner = "oauth2-proxy";
    repo = "oauth2-proxy";
    rev = "v${version}";
    hash = "sha256-o5wJVi8TJ7Qfzn2JzoMSLNhDWSRC7HcrfrQOlMlQr/0=";
  };

  vendorHash = "sha256-35eJ+vw8V5/nSYsBjlkWvQg2xyvmT5PTDtzZA7b/KkU=";

  env.CGO_ENABLED = 0;

  ldflags = [
    "-s" "-w"
    "-X main.VERSION=${version}"
  ];

  doCheck = false;

  meta = with lib; {
    description = "A reverse proxy that provides authentication with Google, Azure, OpenID Connect and many more identity providers";
    homepage = "https://oauth2-proxy.github.io/oauth2-proxy/";
    license = licenses.mit;
  };
}
