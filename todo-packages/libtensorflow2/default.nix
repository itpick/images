{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libtensorflow2
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libtensorflow2";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libtensorflow2";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libtensorflow2";
    homepage = "https://github.com/TODO/libtensorflow2";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
