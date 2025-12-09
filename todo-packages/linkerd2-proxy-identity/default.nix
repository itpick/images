{ lib, stdenv, fetchFromGitHub, ... }:

# Package: linkerd2-proxy-identity
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "linkerd2-proxy-identity";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "linkerd2-proxy-identity";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for linkerd2-proxy-identity";
    homepage = "https://github.com/TODO/linkerd2-proxy-identity";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
