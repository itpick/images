{ lib, stdenv, fetchFromGitHub, ... }:

# Package: keyutils-libs
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "keyutils-libs";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "keyutils-libs";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for keyutils-libs";
    homepage = "https://github.com/TODO/keyutils-libs";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
