{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libnl3
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libnl3";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libnl3";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libnl3";
    homepage = "https://github.com/TODO/libnl3";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
