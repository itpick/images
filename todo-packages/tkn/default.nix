{ lib, stdenv, fetchFromGitHub, ... }:

# Package: tkn
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "tkn";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "tkn";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for tkn";
    homepage = "https://github.com/TODO/tkn";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
