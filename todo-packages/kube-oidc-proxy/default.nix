{ lib, stdenv, fetchFromGitHub, ... }:

# Package: kube-oidc-proxy
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "kube-oidc-proxy";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "kube-oidc-proxy";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for kube-oidc-proxy";
    homepage = "https://github.com/TODO/kube-oidc-proxy";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
