{ lib, stdenv, fetchFromGitHub, ... }:

# Package: trillian-logserver
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "trillian-logserver";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "trillian-logserver";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for trillian-logserver";
    homepage = "https://github.com/TODO/trillian-logserver";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
