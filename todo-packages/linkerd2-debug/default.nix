{ lib, stdenv, fetchFromGitHub, ... }:

# Package: linkerd2-debug
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "linkerd2-debug";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "linkerd2-debug";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for linkerd2-debug";
    homepage = "https://github.com/TODO/linkerd2-debug";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
