{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libsz
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libsz";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libsz";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libsz";
    homepage = "https://github.com/TODO/libsz";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
