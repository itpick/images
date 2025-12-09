{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libacl1
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libacl1";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libacl1";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libacl1";
    homepage = "https://github.com/TODO/libacl1";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
