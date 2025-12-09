{ lib, stdenv, fetchFromGitHub, ... }:

# Package: libpulse
# TODO: Find source and implement derivation

stdenv.mkDerivation rec {
  pname = "libpulse";
  version = "0.0.0";  # TODO: Set version

  src = fetchFromGitHub {
    owner = "TODO";
    repo = "libpulse";
    rev = "v${version}";
    sha256 = lib.fakeSha256;
  };

  meta = with lib; {
    description = "TODO: Add description for libpulse";
    homepage = "https://github.com/TODO/libpulse";
    license = licenses.asl20;  # TODO: Verify license
    maintainers = [ ];
    platforms = platforms.linux;
  };
}
