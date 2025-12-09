{ lib, stdenv, fetchFromGitHub, ... }:

# Package: losetup
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "losetup";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "losetup";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for losetup";
    homepage = "https://github.com/TODO/losetup";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
