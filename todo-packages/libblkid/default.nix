{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libblkid
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libblkid";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libblkid";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libblkid";
    homepage = "https://github.com/TODO/libblkid";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
