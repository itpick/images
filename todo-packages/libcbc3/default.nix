{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libcbc3
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libcbc3";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libcbc3";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libcbc3";
    homepage = "https://github.com/TODO/libcbc3";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
