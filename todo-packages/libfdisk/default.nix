{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libfdisk
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libfdisk";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libfdisk";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libfdisk";
    homepage = "https://github.com/TODO/libfdisk";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
