{ lib, stdenv, fetchFromGitHub, ... }:

# Package: linkerd2-proxy-init
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "linkerd2-proxy-init";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "linkerd2-proxy-init";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for linkerd2-proxy-init";
    homepage = "https://github.com/TODO/linkerd2-proxy-init";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
