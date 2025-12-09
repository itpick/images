{ lib, stdenv, fetchFromGitHub, ... }:

# Package: liblz4-1
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "liblz4";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "liblz4";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for liblz4";
    homepage = "https://github.com/TODO/liblz4";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
