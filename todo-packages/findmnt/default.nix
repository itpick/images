{ lib, stdenv, fetchFromGitHub, ... }:

# Package: findmnt
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "findmnt";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "findmnt";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for findmnt";
    homepage = "https://github.com/TODO/findmnt";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
