{ lib, stdenv, fetchFromGitHub, ... }:

# Package: blockdev
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "blockdev";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "blockdev";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for blockdev";
    homepage = "https://github.com/TODO/blockdev";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
