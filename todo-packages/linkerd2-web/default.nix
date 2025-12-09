{ lib, stdenv, fetchFromGitHub, ... }:

# Package: linkerd2-web
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "linkerd2-web";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "linkerd2-web";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for linkerd2-web";
    homepage = "https://github.com/TODO/linkerd2-web";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
