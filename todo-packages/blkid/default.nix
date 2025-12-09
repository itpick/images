{ lib, stdenv, fetchFromGitHub, ... }:

# Package: blkid
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "blkid";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "blkid";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for blkid";
    homepage = "https://github.com/TODO/blkid";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
